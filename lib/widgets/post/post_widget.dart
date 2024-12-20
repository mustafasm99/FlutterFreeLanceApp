import 'package:cached_network_image/cached_network_image.dart';
import 'package:finailtask/API/controllers/request_project_controller.dart';
import 'package:finailtask/API/controllers/user_controller.dart';
import 'package:finailtask/API/models/posts/post_user.dart';
import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/util/icons.dart';
import 'package:finailtask/widgets/full_screen_button.dart';
import 'package:finailtask/widgets/post/status.dart';
import 'package:finailtask/widgets/post/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:shimmer/shimmer.dart';
import 'package:get/get.dart';

class PostWidget extends StatelessWidget {
  final String? imageUrl;
  final PostUser user;
  final String title;
  final String description;


  PostWidget({
    super.key,
    this.imageUrl,
    required this.user,
    required this.title,
    required this.description,
  });

  UserController userController = Get.find<UserController>();
  RequestsProjectController requestsProjectForm = Get.find();


  @override
  Widget build(BuildContext context) {
    print(
      "PostWidget: ${user.name} ${user.imageUrl} ${user.date} ${user.status}",
    );
    PostController controller = Get.put<PostController>(PostController());
    return Container(
      width: context.width * 0.9,
      height: controller.expanded.value ? double.maxFinite : null,
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300]!,
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      padding: const EdgeInsets.all(12),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  (user.imageUrl == null
                      ? Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.grey[300],
                          ),
                        )
                      : CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                            user.imageUrl ?? '',
                          ),
                        )),
                  const SizedBox(width: 5),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        user.name ?? '',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: context.fontFamily,
                        ),
                      ),
                      Text(
                        user.date ?? '',
                        style: TextStyle(
                          fontSize: 12,
                          color: context.fontColor,
                          fontFamily: context.fontFamily,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 5),
                  PostStatus(status: user.status ?? ''),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_vert,
                      color: context.fontColor,
                      size: 35,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: context.fontFamily,
              ),
            ),
            const SizedBox(height: 10),
            Obx(
              () {
                return AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        description,
                        maxLines: controller.expanded.value ? null : 2,
                        overflow: controller.expanded.value
                            ? TextOverflow.visible
                            : TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          color: context.fontColor,
                          fontFamily: context.fontFamily,
                        ),
                      ),
                      description.length > 50 ? TextButton(
                        onPressed: () {
                          controller.expanded.value =
                              !controller.expanded.value;
                        },
                        child: Text(
                          controller.expanded.value ? 'Show less' : 'Show more',
                          style: TextStyle(
                            color: context.primaryColor,
                            fontFamily: context.fontFamily,
                          ),
                        ),
                      ):const SizedBox(),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            imageUrl != null
                ? CachedNetworkImage(
                    imageUrl: imageUrl ?? '',
                    imageBuilder: (context, imageProvider) => Container(
                      width: context.width * 0.9,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: context.width * 0.9,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const SizedBox(),
                  )
                : const SizedBox(height: 1),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: ProjectIcons.favorite(color: Colors.black, size: 30)),
                const Text(
                  "like",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black45,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {},
                  icon: ProjectIcons.message(color: Colors.black, size: 30),
                ),
                const Text(
                  "comment",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black45,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
            if(userController.getUser().userType == "FREELANCER".toLowerCase())
            FullScreenButton(
              onPressed: () {
                requestsProjectForm.selectedPost = user;
                Get.toNamed("/requests-project");
              },
              inputText: "Apply Now",
              color: context.primaryDark,
              isActive: true,
              height: 45,
            ),
          ],
        ),
      ),
    );
  }
}
