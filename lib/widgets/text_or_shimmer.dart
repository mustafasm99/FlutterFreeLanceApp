import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TextOrShimmer extends StatelessWidget {
  final Text text;
  final double? width;
  final double? height;
  final bool isShimmer;
  const TextOrShimmer({super.key , required this.text , this.width , required this.isShimmer , this.height});

  @override
  Widget build(BuildContext context) {
    return isShimmer == false
        ? text
        : Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: context.fontColor,
            child: Container(
              width: width ?? 20,
              height: height ?? 20,
              color: Colors.white,
            ),
          );
  }
}