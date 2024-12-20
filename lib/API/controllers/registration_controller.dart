import 'package:dio/dio.dart';
import 'package:finailtask/API/base/base_error_response.dart';
import 'package:finailtask/API/base/base_requests.dart';
import 'package:finailtask/API/base/base_response.dart';
import 'package:finailtask/API/controllers/user_controller.dart';
import 'package:finailtask/API/models/auth/user.dart';
import 'package:get/get.dart';
import '/caching/sharedPrefs.dart';

class RegistrationController extends GetxController {
  final name = ''.obs;
  final username = ''.obs;
  final phoneNumber = ''.obs;
  final password = ''.obs;
  final userType = ''.obs;
  RxString? skills;
  RxString? companyName;

  UserController userController = Get.find();

  final oTp = ''.obs;

  void setData(Map<String, String> data) {
    name.value = data['name']!;
    password.value = data['password']!;
    userType.value = data['userType']!;
    phoneNumber.value = data['phoneNumber']!;
    oTp.value = data['oTp']!;
  }

  Map<String, dynamic> get getData => {
        "name": name.value,
        "email": username.value,
        "phoneNumber": "+964${phoneNumber.value}",
        "password": password.value,
        "userType": userType.value,
        "companyName":
            companyName?.value.isEmpty ?? true ? null : companyName?.value,
      };

  Future<bool> sendPhoneNumber() async {
    if (phoneNumber.value.isEmpty) {
      return false;
    }
    try {
    
      var response = await BaseRequests().post('auth/send-verification-code',
          data: {'phoneNumber': "+964${phoneNumber.value}"});
      print(response);
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      return false;
    }
    return false;
  }

  Future<bool> verfiyPhonNumber() async {
    
    if (phoneNumber.value.isEmpty || oTp.value.isEmpty) {
      return false;
    }
    try {
      var response = await BaseRequests().post('auth/verify-phone-number',
          data: {'phone': phoneNumber.value, 'otp': oTp.value});
      if (response.statusCode == 200) {
        print(response.data);
        return true;
      }
    } catch (e) {
      return false;
    }
    return false;
  }

  Future<BaseResponse> register() async {
    BaseResponse outputResponse = BaseResponse(status: false);
    var dio = Dio(
      BaseOptions(
        baseUrl: 'http://16.170.247.41/api/mobile/v1/',
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    try {
      var response = await dio.post('auth/complete-registration', data: getData);
      if (response.statusCode == 201) {
        // Success
        outputResponse.status = true;
        
      }
    } on DioException catch (e) {
      // Handle 400 status code specifically
      if (e.response?.statusCode == 400) {
        final errorMessages = e.response?.data['errors'] as List<dynamic>?;
        if (errorMessages != null && errorMessages.isNotEmpty) {
          final firstErrorMessage = errorMessages[0]['message'];
          outputResponse.response = {"errorMessages": errorMessages};
          outputResponse.message = firstErrorMessage;
        }
      }
    } catch (error) {
      // Handle other types of errors
      outputResponse.response = {};
      outputResponse.status = false;
    }
    return outputResponse;
  }

  Future<bool> login() async {
    print("Login");
    try {
      var response = await BaseRequests().post('auth/login',
          data: {'email': username.value, 'password': password.value});
      if (response.statusCode == 200) {
        print(response.data['results']?['accessToken']);
        print("from Login");
        SharedPrefs().setMap('auth', response.data);
        SharedPrefs().setString('token', response.data['results']?['accessToken']);
        userController.setUser(Users.fromJson(response.data));
        return true;
      }else{
        return false;
      }
    }
    catch (e) {
      return false;
    }
  }

}
