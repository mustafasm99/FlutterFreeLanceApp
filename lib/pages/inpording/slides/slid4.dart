import 'dart:math';

import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/pages/inpording/slides/base_slid.dart';
import 'package:finailtask/pages/inpording/ui_controller/form_controller.dart';
import 'package:finailtask/pages/inpording/ui_controller/slider_controller.dart';
import 'package:finailtask/widgets/inputs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Slid4 extends StatelessWidget {
  Slid4({super.key});
  var controller = Get.put(FromController());
  var SliderController = Get.put(sliderController());

  @override
  Widget build(BuildContext context) {
    return BaseSlidBody(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Enter Your Information",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w900,
              fontFamily: context.fontFamily,
            ),
          ),
          Text(
            "Please enter your personal information to complete the registration process.",
            style: TextStyle(
              fontSize: 16,
              color: context.fontColor,
              fontFamily: context.fontFamily,
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            "First Name",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NormalInput(
                  controller: controller.nameInput,
                  onChanged: (value){
                    if(controller.formKey.currentState!.validate()){
                      SliderController.updateIsLastPage(true);
                      SliderController.isSliderActive(true);
                    }
                  },
                  vallation: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your name";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                NormalInput(
                  controller: controller.emailInput,
                  onChanged: (value){
                    if(controller.formKey.currentState!.validate()){
                      SliderController.updateIsLastPage(true);
                      SliderController.isSliderActive(true);
                    }
                  },
                  vallation: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your email";
                    }
                    if (!GetUtils.isEmail(value)) {
                      return "Please enter a valid email";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                PasswordInputField(
                  onChanged: (value){
                    if(controller.formKey.currentState!.validate()){
                      SliderController.updateIsLastPage(true);
                      SliderController.isSliderActive(true);
                    }
                  },
                  controller: controller.passwordInput,
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
          ),
        ],
      ),
    );
  }
}
