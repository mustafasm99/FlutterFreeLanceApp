import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/pages/inpording/impording_page.dart';
import 'package:flutter/material.dart';

class FullScreenButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget? icon;
  final String inputText;
  final Color color;
  final bool isActive;

  const FullScreenButton({
    super.key,
    required this.onPressed,
    this.icon,
    required this.inputText,
    required this.color,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      backgroundColor: isActive ? color : context.unActive,
      minimumSize: const Size.fromHeight(70),
      ),
      onPressed: onPressed,
      child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
        inputText,
        style:TextStyle(
          color: isActive ? Colors.white : context.fontColor,
        ),
        ),
        const SizedBox(width: 10),
        icon ?? const SizedBox.shrink(),
      ],
      ),
    );
    }
  }
