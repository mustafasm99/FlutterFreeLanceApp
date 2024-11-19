import 'package:cached_network_image/cached_network_image.dart';
import 'package:finailtask/API/controllers/user_controller.dart';
import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/widgets/text_or_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});
  UserController get userController => Get.find<UserController>();
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 100,
          height: 100,
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.fromBorderSide(
              BorderSide(
                color: context.primaryColor,
                width: 4,
              ),
            ),
            image: const DecorationImage(
              image: CachedNetworkImageProvider(
                "https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextOrShimmer(
          text: Text(
            userController.getUser().name ?? "",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              fontFamily: context.fontFamily,
            ),
          ),
          isShimmer: userController.getUser().name == null,
          width: 200,
        ),
        const SizedBox(
          height: 10,
        ),
        TextOrShimmer(
          isShimmer: userController.getUser().userType == null,
          width: 120,
          height: 10,
          text: Text(
            userController.getUser().userType ?? "",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: context.fontFamily,
            ),
          ),
        )
      ],
    );
  }
}
