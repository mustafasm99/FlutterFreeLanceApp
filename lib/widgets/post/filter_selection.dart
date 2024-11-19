import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/widgets/post/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterSelection extends StatelessWidget {
  final String text;
  bool? value = false;
  void Function(bool?)? onChanged;

  FilterSelection({
    super.key,
    this.onChanged,
    required this.text,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           Checkbox(
              side: BorderSide(
                color: context.fontColor,
                width: 1,
              ),
              value: value,
              onChanged: onChanged,
            ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
