import 'package:flutter/material.dart';

class FullScreenButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget icon;
  final String inputText;
  final Color color;

  const FullScreenButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.inputText,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: color,
      minimumSize: const Size.fromHeight(70),
      ),
      onPressed: onPressed,
      child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
        inputText,
        style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(width: 10),
        icon,
      ],
      ),
    );
    }
  }
