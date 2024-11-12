import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/util/icons.dart';
import 'package:finailtask/widgets/widget_controllers/password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NormalInput extends StatelessWidget {
  final TextEditingController controller;
  void Function(String)? onChanged = (value) {};
  NormalInput({super.key, required this.controller , this.onChanged});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
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
  void Function(String)? onChanged = (value) {};

  PasswordInputField({super.key, required this.controller , this.onChanged});
  var widgetController = Get.put(PasswordController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        onChanged: onChanged,
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
