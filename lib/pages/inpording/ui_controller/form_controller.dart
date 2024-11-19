import 'package:get/get.dart';
import 'package:flutter/material.dart';

class FromController extends GetxController {
  final name = ''.obs;
  final email = ''.obs;
  final password = ''.obs;

  final TextEditingController nameInput = TextEditingController();
  final TextEditingController emailInput = TextEditingController();
  final TextEditingController passwordInput = TextEditingController();
  var formKey = GlobalKey<FormState>();
  void setData(Map<String ,String> data){
    name.value = data['name']!;
    email.value = data['email']!;
    password.value = data['password']!;
  }

  Map<String, String> get getData => {
    'name': name.value,
    'email': email.value,
    'password': password.value,
  };


  bool is_valid(){
    RegExp passwordRegExp = RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$');
    RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!passwordRegExp.hasMatch(password.value)) {
      return false;
    }
    if (!emailRegExp.hasMatch(email.value)) {
      return false;
    }
    if (name.value.length < 4 || name.value.length > 50) {
      return false;
    }
    if(name.value.isEmpty || email.value.isEmpty || password.value.isEmpty){
      return false;
    }
    return true;
  }

  bool isValidPassword(String password){
    RegExp passwordRegExp = RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$');
    return passwordRegExp.hasMatch(password);
  }
}