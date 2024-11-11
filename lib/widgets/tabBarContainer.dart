import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class Tabbarcontainer extends StatelessWidget {
  final bool active;
  final double? width;
  const Tabbarcontainer({
    Key? key,
    required this.active,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width * 0.28,
      height: 8,
      decoration: BoxDecoration(
        color: active ? context.primaryColor : Colors.black45,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
