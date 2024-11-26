import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/pages/projects/widgets/line.dart';
import 'package:flutter/material.dart';

import '../../../util/icons.dart';

class SkillsWidget extends StatelessWidget {
  final String title;

  SkillsWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Row(
            children: [
              ProjectIcons.multipleUsers(),
              const SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: context.fontFamily),
              )
            ],
          ),
          const SizedBox(height: 10),
          const PageLine(),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
