import 'package:carousel_slider/carousel_slider.dart';
import 'package:finailtask/API/controllers/projects_controller.dart';
import 'package:finailtask/API/controllers/user_controller.dart';
import 'package:finailtask/extentions/sizeing.dart';
import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/pages/create_project/widgets/bottom_nav.dart';
import 'package:finailtask/pages/create_project/controller/create_project_slider_controller.dart';
import 'package:finailtask/pages/create_project/sliders/slid1.dart';
import 'package:finailtask/pages/create_project/sliders/slid2.dart';
import 'package:finailtask/util/icons.dart';
import 'package:finailtask/widgets/full_screen_button.dart';
import 'package:finailtask/widgets/page_title_widget.dart';
import 'package:finailtask/widgets/tabBarContainer.dart';
import 'package:finailtask/widgets/template.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateProject extends StatelessWidget {
  CreateProject({super.key});

  CreateProjectSliderController controller =
      Get.put(CreateProjectSliderController());
  CarouselSliderController carouselController = CarouselSliderController();
  CreateProjectFormController createProjectFromController = Get.put(CreateProjectFormController());

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CreateProjectSliderController());
    return Template(
      havFloatingButton: false,
      bottomNavigationBar: Obx(
        () {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.only(bottom: 20),
            child: controller.currentIndex.value >= 1
                ? FullScreenButton(
                    onPressed:() async {
                      await createProjectFromController.createProject();
                        Get.offNamed('/feed');
                        Get.snackbar("Project", "Project created successfully");
                      
                      
                    },
                    inputText: "Add Project",
                    icon: ProjectIcons.plusSign(
                      color: Colors.white,
                      size: 30,
                    ),
                    isActive: true,
                    color: context.primaryDark)
                : BottomNavCreateProject(
                    carouselSliderController: carouselController,
                  ),
          );
        },
      ),
      freeSpace: const PageTitle(title: "Create Project"),
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(top: 10),
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Tabbarcontainer(
                      active: true,
                      width: context.screenWidth * 0.44,
                    ),
                    Tabbarcontainer(
                      active: controller.currentIndex >= 1,
                      width: context.screenWidth * 0.44,
                    ),
                  ],
                );
              },
            ),
            CarouselSlider(
              carouselController: carouselController,
              options: CarouselOptions(
                height: context.screenHeight * 0.6,
                viewportFraction: 1,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  controller.currentIndex.value = index;
                },
                scrollPhysics: const NeverScrollableScrollPhysics(),
              ),
              items:[
                CreateProjectSlid1(),
                const CreateProjectSlider2(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
