import 'package:cached_network_image/cached_network_image.dart';
import 'package:finailtask/API/controllers/user_controller.dart';
import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/pages/dashbord/widgets/project_status.dart';
import 'package:finailtask/widgets/post/status.dart';
import 'package:finailtask/widgets/text_or_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String status;
  final double percentage;
  final int id;
  UserController user = Get.find();
  ProjectCard({
    super.key,
    required this.id,
    required this.title,
    required this.status,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed("/project/$id,$title");
      },
      child: Container(
        width: context.width * 0.8,
        height: 160,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextOrShimmer(
                    text: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    isShimmer: false,
                  ),
                  ProjectStatusWidget(
                      status: status == "In Progress"
                          ? ProjectStatus.inProgress
                          : status == "Completed"
                              ? ProjectStatus.completed
                              : ProjectStatus.pending),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 35,
                          height: 35,
                          margin: const EdgeInsets.only(top: 0, right: 10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: context.primaryColor,
                            image: const DecorationImage(
                              image: CachedNetworkImageProvider(
                                "https://static.vecteezy.com/system/resources/thumbnails/005/346/410/small_2x/close-up-portrait-of-smiling-handsome-young-caucasian-man-face-looking-at-camera-on-isolated-light-gray-studio-background-photo.jpg",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        TextOrShimmer(
                            width: 100,
                            height: 40,
                            text: Text(
                              user.getUser().name ?? "",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            isShimmer: user.getUser().name == null),
                      ],
                    ),
                  )
                ],
              ),
            ),
            CircularPercentIndicator(
              radius: 50,
              lineWidth: 10,
              percent: percentage / 100,
              progressColor: status == "In Progress"
                  ? Colors.yellow[700]!
                  : status == "Completed"
                      ? Colors.green[700]!
                      : Colors.red[700]!,
              center: Text(
                "$percentage%",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
