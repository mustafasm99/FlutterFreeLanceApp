import 'package:finailtask/API/models/auth/user.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var userController = Users().obs;
  @override
  void onInit() {
    super.onInit();
  }

  void setUser(Users user){
    userController.value = user;
  }

  Users getUser(){
    return userController.value;
  }
}