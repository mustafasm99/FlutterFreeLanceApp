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
          NormalInput(
            controller: controller.nameInput,
            onChanged: (value) {
              controller.name.value = value;
              if (controller.is_valid()) {
                SliderController.isSliderActive(true);
                SliderController.update();
              }
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
            onChanged: (value) {
              controller.email.value = value;
              if (controller.is_valid()) {
                SliderController.isSliderActive(true);
                SliderController.update();
              }
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
            controller: controller.passwordInput,
            onChanged: (value) {
              controller.password.value = value;
              if (controller.is_valid()) {
                SliderController.isSliderActive(true);
                SliderController.update();
              }
            },
          ),
        ],
      ),
    );
  }
}
