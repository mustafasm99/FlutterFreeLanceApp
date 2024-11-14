import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/pages/profile/project_item.dart';
import 'package:finailtask/util/icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ProfileProjectHistory extends StatelessWidget {
  const ProfileProjectHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        color: context.hoverColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Project History",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: context.fontFamily,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.offNamed('/create-project');
                    },
                    icon: ProjectIcons.plusSign(
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: ProjectIcons.edit(
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            child: Column(
              children: [
                ProjectItem(
                  projectTitle: "Project 1",
                  projectDescription:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec purus feugiat, ",
                  projectDate: "2021-10-10",
                  circleColor: context.primaryColor,
                  lineColor: context.primaryColor,
                ),
                ProjectItem(
                  projectTitle: "Project 2",
                  projectDescription:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec purus feugiat, ",
                  projectDate: "2021-10-10",
                  circleColor: context.primaryColor,
                  lineColor: context.primaryColor,
                ),
                // Add more ProjectItem widgets here
              ],
            ),
          ),
        ],
      ),
    );
  }
}
