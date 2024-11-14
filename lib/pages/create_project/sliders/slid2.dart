import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:flutter/material.dart';

class CreateProjectSlider2 extends StatelessWidget {
  const CreateProjectSlider2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        const Text(
          "Project Duration",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: "Enter Project Duration",
            hintStyle: TextStyle(
              color: context.fontColor,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: context.fontColor, width: 2),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: context.primaryColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          "Price of The Project",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: "Enter Price of The Project",
            hintStyle: TextStyle(
              color: context.fontColor,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: context.fontColor, width: 2),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: context.primaryColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
