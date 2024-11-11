import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/util/icons.dart';
import 'package:finailtask/widgets/widget_controllers/password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NormalInput extends StatelessWidget {
  final TextEditingController controller;
  const NormalInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: context.primaryColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: context.primaryColor,
          ),
        ),
      ),
    );
  }
}

class PasswordInputField extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  PasswordInputField({super.key, required this.controller});
  var widgetController = Get.put(PasswordController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        controller: controller,
        obscureText: widgetController.show.value,
        decoration: InputDecoration(
          hintText: "Password",
          suffixIcon: IconButton(
            icon: widgetController.show.value
                ? ProjectIcons.viewOff(
                    color: context.primaryColor,
                  )
                : ProjectIcons.view(
                    color: context.primaryColor,
                  ),
            onPressed: () {
              print(widgetController.show.value);
              widgetController.show.value = !widgetController.show.value;
            },
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: context.primaryColor,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: context.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
