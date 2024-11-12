import 'package:cached_network_image/cached_network_image.dart';
import 'package:finailtask/extentions/sizeing.dart';
import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/pages/inpording/impording_page.dart';
import 'package:finailtask/util/icons.dart';
import 'package:flutter/material.dart';

class TopNavigationBar extends StatelessWidget implements PreferredSizeWidget {
  // final String title;
  String imageUrl =
      "https://img.freepik.com/free-photo/young-tender-curly-girl-holding-documents_176420-238.jpg";
  String name = "John Doe";
  String userType = "Client";
  TopNavigationBar({super.key , required this.imageUrl, required this.name,required this.userType});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // toolbarHeight: 80,
      flexibleSpace: Container(
        width: context.screenWidth * 0.5,
        margin: const EdgeInsets.symmetric(horizontal: 15 , vertical: 14),
        // color: Colors.red,
        // height: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: CachedNetworkImageProvider(imageUrl),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: context.fontFamily,
                  ),
                ),
                Text(
                  userType,
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
        IconButton(onPressed: () {}, icon: ProjectIcons.notification()),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
