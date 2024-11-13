import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/util/icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class SettingsSelection extends StatelessWidget {
  final Widget? icon;
  final String title;
  final String deepLink;
  const SettingsSelection({
    super.key,
    this.icon,
    required this.title,
    required this.deepLink,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12 , vertical: 1),
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              icon != null
                  ? Container(
                      width: 50,
                      height: 50,
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        // borderRadius: BorderRadius.circular(10),
                        shape: BoxShape.circle,
                      ),
                      child: icon,
                    )
                  : Shimmer.fromColors(
                      baseColor: context.fontColor,
                      highlightColor: Colors.grey[300]!,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: context.primaryColor,
                          // borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
              const SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: context.fontFamily,
                ),
              ),
            ],
          ),
          IconButton(
              onPressed: () => Get.toNamed(deepLink),
              icon: ProjectIcons.arrowRight()),
        ],
      ),
    );
  }
}
