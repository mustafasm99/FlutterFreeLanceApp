import 'package:get/get.dart';
import 'package:flutter/material.dart';

class FromController extends GetxController {
  final name = ''.obs;
  final email = ''.obs;
  final password = ''.obs;

  final TextEditingController nameInput = TextEditingController();
  final TextEditingController emailInput = TextEditingController();
  final TextEditingController passwordInput = TextEditingController();

  void setData(Map<String ,String> data){
    name.value = data['name']!;
    email.value = data['email']!;
    password.value = data['password']!;
  }


}