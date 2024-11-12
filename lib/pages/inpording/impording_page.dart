import 'package:finailtask/extentions/sizeing.dart';
import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/pages/inpording/slides/slid3.dart';
import 'package:finailtask/pages/inpording/slides/slid4.dart';
import 'package:finailtask/pages/inpording/ui_controller/slider_controller.dart';
import 'package:finailtask/util/button_text.dart';
import 'package:finailtask/util/icons.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:finailtask/pages/inpording/slides/slid1.dart';
import 'package:finailtask/pages/inpording/slides/slid2.dart';
import 'package:finailtask/widgets/full_screen_button.dart';
import 'package:finailtask/widgets/tabBarContainer.dart';
import 'package:get/get.dart';

class InpordingView extends StatelessWidget {
  const InpordingView({super.key});

  @override
  Widget build(BuildContext context) {
    CarouselSliderController InpordingsliderController =
        CarouselSliderController();
    var controller = Get.put(sliderController());
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(top: 20),
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Tabbarcontainer(
                    active: controller.currentSlider.value >= 0,
                  ),
                  Container(
                    width: context.width * 0.28,
                    height: 8,
                    decoration: BoxDecoration(
                      color: controller.currentSlider.value >= 2 ? context.primaryColor : Colors.black45,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: (context.width * 0.28)/2,
                          height: 8,
                          decoration: BoxDecoration(
                            color: controller.currentSlider.value >= 1 ? context.primaryColor : null,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Tabbarcontainer(
                    active: controller.currentSlider.value >= 3,
                  ),
                ],
              ),
              SizedBox(
                height: 550,
                child: CarouselSlider(
                  items: [
                    Slid1(),
                    Slid2(),
                    Slid3(),
                    Slid4(),
                  ],
                  options: CarouselOptions(
                    height: double.infinity,
                    viewportFraction: 1,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) {
                      controller.currentSlider.value = index;
                    },
                    scrollPhysics: const NeverScrollableScrollPhysics(),
                  ),
                  carouselController: InpordingsliderController,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: FullScreenButton(
                    onPressed: () {
                      if (controller.currentSlider.value < 3) {
                        if (controller.isSliderActive.value) {
                          controller.currentSlider.value++;
                          controller.isSliderActive(false);
                        }
                      } else {
                        Get.offAllNamed('/feed');
                      }
                      InpordingsliderController.animateToPage(
                          controller.currentSlider.value);
                    },
                    icon: controller.currentSlider.value == 0
                        ? ProjectIcons.arrowRight(
                            color: controller.isSliderActive.value
                                ? Colors.white
                                : context.fontColor,
                          )
                        : null,
                    inputText: getButtonText(controller.currentSlider.value),
                    color: context.primaryColor,
                    isActive: controller.isSliderActive.value,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
