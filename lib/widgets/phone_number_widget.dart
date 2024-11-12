import 'package:country_code_picker/country_code_picker.dart';
import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneNumberWidget extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onChanged;
  const PhoneNumberWidget({super.key , required this.controller , this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      // padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: context.fontColor,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const CountryCodePicker(
              onChanged: print,
              initialSelection: 'IQ',
              favorite: ['+964', 'IQ'],
              showCountryOnly: false,
              showOnlyCountryWhenClosed: false,
              alignLeft: false,
              padding: EdgeInsets.zero,
            ),
          ),
          Expanded(
            child: Container(
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 5),
                child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                onChanged: onChanged,
                controller: controller,
                style: TextStyle(
                  color: context.fontColor,
                  fontFamily: context.fontFamily,
                ),
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  hintStyle: TextStyle(
                  color: context.fontColor,
                  fontFamily: context.fontFamily,
                  ),
                  enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: context.fontColor,
                  ),
                  ),
                  focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: context.fontColor,
                  ),
                  ),
                ),
                ),
              ),
              ),
            ],
            ),
    );
  }
}
