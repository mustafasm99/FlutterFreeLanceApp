import 'package:flutter/material.dart';

class TitledButton extends StatelessWidget {
  final void Function() onPressed;
  final Color backGroundColor ;
  final Color textColor;
  final String text;
  const TitledButton({super.key , required this.onPressed , this.backGroundColor = Colors.blue , this.textColor = Colors.white , required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        // width: 80,
        // height: 50,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}