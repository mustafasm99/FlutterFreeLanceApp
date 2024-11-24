import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/widgets/image_holder.dart';
import 'package:flutter/material.dart';


class EducationsWidgets extends StatelessWidget {
  final String imageLink, title, description;
  final DateTime startDate, endDate;

  const EducationsWidgets({
    super.key,
    required this.imageLink,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageHolder(link: imageLink),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: context.fontFamily,
                  ),
                ),
                Text(
                    '${startDate.year} ${startDate.month} ${startDate.day} - ${endDate.year} ${endDate.month} ${endDate.day}',
                  style: TextStyle(
                    fontSize: 12,
                    color: context.fontColor,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: context.fontFamily,
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
