import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:flutter/material.dart';

class ProjectItem extends StatelessWidget {
  final String projectTitle;
  final String projectDescription;
  final String projectDate;
  final Color circleColor;
  final Color lineColor;

  const ProjectItem({
    super.key,
    required this.projectTitle,
    required this.projectDescription,
    required this.projectDate,
    required this.circleColor,
    required this.lineColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8.0), // Add padding if needed
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: circleColor,
                ),
              ),
              Container(
                width: 2,
                // height: double.infinity, // Set a custom height or adjust as needed
                height: 120,
                color: lineColor,
              ),
            ],
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  projectTitle,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: context.fontFamily,
                  ),
                ),
                Text(
                  projectDate,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: context.fontFamily,
                    color: context.fontColor,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  projectDescription,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: context.fontFamily,
                    color: context.fontColor,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
