import 'package:get/get.dart';

class PasswordController extends GetxController {
  final password = ''.obs;
  final show = true.obs;


  void setData(Map<String, String> data) {
    password.value = data['password']!;
  }

  void toggleShow() {
    show.value = !show.value;
  }
}