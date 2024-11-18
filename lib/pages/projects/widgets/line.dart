import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:flutter/material.dart';

class PageLine extends StatelessWidget {
  const PageLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      color: context.fontColor,
    );
  }
}
