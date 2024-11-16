import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/util/icons.dart';
import 'package:flutter/material.dart';

class DashboardSearchSection extends StatelessWidget {
  const DashboardSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(
                  color: context.fontColor,
                  fontFamily: context.fontFamily,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: context.fontColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: context.fontColor,
                  ),
                ),
                suffixIcon: ProjectIcons.filterHorizontal(
                  size: 10,
                  color: context.fontColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: context.primaryColor,
                shape: BoxShape.circle
              ),
              child: ProjectIcons.plusSign(
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}