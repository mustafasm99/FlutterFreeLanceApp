import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/pages/profile/controllers/bio_controler.dart';
import 'package:finailtask/util/icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileBio extends StatelessWidget {
  ProfileBio({super.key});
  BioController get bioController => Get.put(BioController(
    bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
        "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
        "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
        "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. "
        "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  ));

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        width: double.infinity,
        height: bioController.isExpanded.value ? null : 200,
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
                  "About",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    fontFamily: context.fontFamily,
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
            ),
            const SizedBox(
              height: 10,
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeInOut,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      bioController.isExpanded.value =
                          !bioController.isExpanded.value;
                    },
                    child: Text(
                      bioController.bio.value,
                      maxLines: bioController.isExpanded.value ? null : 3,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: context.fontFamily,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
