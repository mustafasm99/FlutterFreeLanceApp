import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/pages/dashbord/widgets/project_status.dart';
import 'package:finailtask/pages/dashbord/project_tab_bar/project_tab_bar.dart';
import 'package:finailtask/pages/projects/sections/freelancer_applied.dart';
import 'package:finailtask/pages/projects/sections/task_tab_bars.dart';
import 'package:finailtask/pages/projects/widgets/line.dart';
import 'package:finailtask/pages/projects/widgets/project_text_status.dart';
import 'package:finailtask/widgets/page_title_widget.dart';
import 'package:finailtask/widgets/template.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:readmore/readmore.dart';

class ProjectView extends StatelessWidget {
  ProjectView({super.key});
  final projectId = Get.parameters['id'];
  final projectTitle = Get.parameters['title'];
  String projectDescription =
      "lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum";
  RxBool seeMore = false.obs;
  ProjectStatus status = ProjectStatus.pending;
  double progress = 50;
  // Get the project from the server using the projectId
  // fetch the response from the server
  // if the response is successful, display the project details
  // if the response is not successful, display an error message
  @override
  Widget build(BuildContext context) {
    return Template(
        freeSpace: PageTitle(title: "$projectTitle"),
        bottomNavigationBar: null,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(10), // Main Container
            child: Column(
              // Main Column
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // first Section { Project Status , timeline , Chart}
                  margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  padding: const EdgeInsets.all(0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          ProjectTextStatus(
                            status: ProjectStatus.inProgress,
                            label: "Status",
                          ),
                          ProjectTextStatus(
                            status: ProjectStatus.inProgress,
                            label: "Timeline",
                            title: "3 months",
                            titleColor: context.fontColor,
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: CircularPercentIndicator(
                          radius: 30,
                          lineWidth: 6,
                          percent: progress / 100,
                          center: Text(
                            "$progress%",
                            style: TextStyle(
                              color: context.fontColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          progressColor: context.pendingColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const PageLine(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Project Description :",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        AnimatedSize(
                          duration: const Duration(milliseconds: 500),
                          child: ReadMoreText(
                            projectDescription,
                            trimLines: 1,
                            colorClickableText: context.primaryColor,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: '...Read more',
                            trimExpandedText: ' show less',
                            style: TextStyle(
                              color: context.fontColor,
                              fontSize: 16,
                            ),
                            moreStyle: TextStyle(
                              color: context.primaryDark,
                              fontSize: 16,
                            ),
                            lessStyle: TextStyle(
                              color: context.primaryDark,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ]),
                ),
                const PageLine(),
                const SizedBox(height: 20),
                (status == ProjectStatus.inProgress
                    ? TaskTabBars()
                    : FreelancerApplied()),
              ],
            ),
          ),
        ));
  }
}
