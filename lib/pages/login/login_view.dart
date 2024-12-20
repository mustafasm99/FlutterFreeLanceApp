import 'package:finailtask/API/controllers/registration_controller.dart';
import 'package:finailtask/caching/sharedPrefs.dart';
import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/pages/inpording/ui_controller/form_controller.dart';
import 'package:finailtask/router.dart';
import 'package:finailtask/widgets/full_screen_button.dart';
import 'package:finailtask/widgets/inputs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  RegistrationController registerationController = Get.find();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controller = Get.put(FromController());
  RxBool isValid = false.obs;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login Page",
              style: TextStyle(
                color: context.primaryColor,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Form(
              key:_formKey,
              child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Phone Number",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  NormalInput(
                    
                    controller: phoneController,
                    onChanged: (value) {
                      registerationController.username(value);
                      if(_formKey.currentState!.validate()){
                        isValid.value = true;
                      }

                    },
                    vallation: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your phone number";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  PasswordInputField(
                    controller: passwordController,
                    onChanged: (value) {
                      registerationController.password(value);
                      print(isValid.value);

                      if(_formKey.currentState!.validate()){
                        isValid.value = true;
                      }

                    },
                    vallation: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your password";
                      }
                      if (!controller.isValidPassword(value)) {
                        return "Password must contain at least 8 characters, one uppercase letter, one number and one special character";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            )),
            Obx((){
              print(isValid.value);
              return FullScreenButton(
                inputText: "Login",
                color: context.primaryColor,
                isActive: isValid.value,
                onPressed: ()async{
                  if(_formKey.currentState!.validate()){
                    if( await registerationController.login()){
                    Get.snackbar("Login", "Login Successfully");
                    Get.toNamed(AppRouter.home);
                    SharedPrefs().setString("inpording", "Done");
                    }
                    else{
                      Get.snackbar("Login", "Login Failed");
                    }
                  }
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
