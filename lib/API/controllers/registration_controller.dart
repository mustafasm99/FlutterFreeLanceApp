import 'package:finailtask/API/base/base_requests.dart';
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
    var response = await BaseRequests().post('auth/sendVerificationCode',
        data: {'phoneNumber': phoneNumber.value});
    if (response.statusCode == 200) {
      print(response.data);
      return true;
    }
    return false;
  }

  Future<bool> verfiyPhonNumber() async {
    print("verfiyPhonNumber ==========>");
    if (phoneNumber.value.isEmpty || oTp.value.isEmpty) {
      return false;
    }
    var response = await BaseRequests().post('auth/verifyPhoneNumber',
        data: {'phone': phoneNumber.value, 'otp': oTp.value});
    if (response.statusCode == 200) {
      print(response.data);
      return true;
    }
    return false;
  }

  Future<bool> register() async {
    var response =
        await BaseRequests().post('auth/completeRegistration', data: getData);
    try {
      if (response.statusCode == 201) {
        print(response.data);
        return true;
      }
    } catch (error) {
      print("====================================> Error");
    }
    return false;
  }
}
