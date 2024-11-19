import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/util/icons.dart';
import 'package:finailtask/widgets/widget_controllers/password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NormalInput extends StatelessWidget {
  final TextEditingController controller;
  FormFieldValidator? vallation;
  void Function(String)? onChanged = (value) {};
  NormalInput({super.key, required this.controller , this.onChanged , this.vallation});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
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
      validator: vallation,
      cursorErrorColor: Colors.red,
      
    );
  }
}

class PasswordInputField extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  void Function(String)? onChanged = (value) {};
  FormFieldValidator? vallation;

  PasswordInputField({super.key, required this.controller , this.onChanged , this.vallation});
  var widgetController = Get.put(PasswordController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        onChanged: onChanged,
        controller: controller,
        validator: vallation,
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
