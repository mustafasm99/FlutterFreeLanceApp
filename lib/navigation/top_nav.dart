import 'package:cached_network_image/cached_network_image.dart';
import 'package:finailtask/API/controllers/user_controller.dart';
import 'package:finailtask/extentions/sizeing.dart';
import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/pages/inpording/impording_page.dart';
import 'package:finailtask/router.dart';
import 'package:finailtask/util/icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class TopNavigationBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? freeSpace;
  final UserController userController = Get.find();
  TopNavigationBar({super.key , this.freeSpace});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // toolbarHeight: 80,
      leading:Container(),
      flexibleSpace: 
      freeSpace ??
      Container(
        width: context.screenWidth * 0.5,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
        // color: Colors.red,
        // height: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (userController.getUser().imageUrl == null
                ? Shimmer.fromColors(
                    baseColor: context.fontColor,
                    highlightColor: context.primaryDark,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: context.fontColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                : CircleAvatar(
                    radius: 30,
                    backgroundImage: CachedNetworkImageProvider(
                        userController.getUser().imageUrl ?? ''),
                  )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                userController.getUser().name == null
                    ? Shimmer.fromColors(
                        baseColor: context.fontColor,
                        highlightColor: Colors.white,
                        child: Container(
                          width: 100,
                          height: 10,
                          decoration: BoxDecoration(
                            color: context.fontColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      )
                    : Text(
                        userController.getUser().name ?? '',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: context.fontFamily,
                        ),
                      ),
                userController.getUser().userType == null
                    ? Shimmer.fromColors(
                        baseColor: context.fontColor,
                        highlightColor: Colors.white,
                        child: Container(
                          width: 50,
                          height: 10,
                          margin: const EdgeInsets.only(top: 5),
                          decoration: BoxDecoration(
                            color: context.fontColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      )
                    : Text(
                        userController.getUser().userType ?? '',
                        style: TextStyle(
                          color: context.fontColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: context.fontFamily,
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        IconButton(onPressed: () {
          Get.toNamed(AppRouter.notifications);
        }, icon: ProjectIcons.notification()),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
