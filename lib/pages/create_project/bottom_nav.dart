import 'package:carousel_slider/carousel_slider.dart';
import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/pages/create_project/controller/create_project_slider_controller.dart';
import 'package:finailtask/util/icons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BottomNavCreateProject extends StatelessWidget {
  final CarouselSliderController carouselSliderController;
  BottomNavCreateProject({super.key , required this.carouselSliderController});
  CreateProjectSliderController controller = Get.put(CreateProjectSliderController());


  @override
  Widget build(BuildContext context) {
    return Container(
        // color: Colors.red,
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      
                    },
                    icon: ProjectIcons.media(
                      color: context.primaryColor,
                      size: 30,
                    )),
                const Text("Media"),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: ProjectIcons.documents(
                      color: context.primaryColor,
                      size: 30,
                    )),
                const Text("Documents"),
              ],
            ),
            GestureDetector(
              onTap: () {
                if(controller.currentIndex.value > 1){
                  controller.currentIndex.value = 0;
                }
                controller.currentIndex.value++;
                carouselSliderController.animateToPage(
                  controller.currentIndex.value,
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: context.primaryDark,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Next",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    ProjectIcons.arrowRight(
                      color: Colors.white,
                      size: 30,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
  }
}