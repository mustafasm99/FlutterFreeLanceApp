import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  void Function(String value) onChanged;
  OtpInput({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    var dfaulttPinPutTheme = PinTheme(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF999999)),
      ),
      textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.blue,
      ),
    );
    return Pinput(
      controller: controller,
      animationCurve: Curves.easeInOut,
      keyboardType: TextInputType.number,
      onChanged:onChanged,
      length: 6,
      autofocus: true,
      defaultPinTheme: dfaulttPinPutTheme,
      focusedPinTheme: dfaulttPinPutTheme.copyDecorationWith(
        color: Colors.blue.withOpacity(0.2),
        border: Border.all(color: context.primaryColor),
      ),
      pinAnimationType: PinAnimationType.fade,
      showCursor: true,
      cursor: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 2,
            height: 20,
            color: Colors.blue,
          ),
        ],
      ),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      onCompleted: (String pin) {
        print(pin);
      },
    );
  }
}
