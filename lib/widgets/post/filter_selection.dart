import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/widgets/post/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterSelection extends StatelessWidget {
  final String text;
  final CheckBoxController controller; // Pass the controller as a parameter

  FilterSelection({
    super.key,
    required this.text,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                value: controller.state.value,
                onChanged: (value) {
                  controller.changeState();
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2)),
              ),
              const SizedBox(width: 20),
              Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  color: context.fontColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
