import 'package:dio/dio.dart';
import 'package:finailtask/API/base/base_error_response.dart';
import 'package:finailtask/API/base/base_requests.dart';
import 'package:finailtask/API/base/base_response.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  final name = ''.obs;
  final username = ''.obs;
  final phoneNumber = ''.obs;
  final password = ''.obs;
  final userType = ''.obs;
  RxString? skills;
  RxString? companyName;

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
        "username": username.value,
        "phoneNumber": phoneNumber.value,
        "password": password.value,
        "userType": userType.value,
        "skills": skills?.value.isEmpty ?? true ? null : skills?.value,
        "companyName":
            companyName?.value.isEmpty ?? true ? null : companyName?.value,
      };

  Future<bool> sendPhoneNumber() async {
    print("sendPhoneNumber ==========>");
    if (phoneNumber.value.isEmpty) {
      return false;
    }
    try {
      var response = await BaseRequests().post('auth/sendVerificationCode',
          data: {'phoneNumber': phoneNumber.value});
      if (response.statusCode == 200) {
        print(response.data);
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
      var response = await BaseRequests().post('auth/verifyPhoneNumber',
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
        baseUrl: 'http://13.60.35.174/api/mobile/v1/',
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    try {
      var response = await dio.post('auth/completeRegistration', data: getData);

      if (response.statusCode == 201) {
        // Success
        print(response.data);
        outputResponse.status = true;
        outputResponse.response = response.data;
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
}
