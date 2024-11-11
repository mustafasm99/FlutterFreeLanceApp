import 'package:finailtask/extentions/sizeing.dart';
import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/pages/inpording/slides/slid3.dart';
import 'package:finailtask/pages/inpording/slides/slid4.dart';
import 'package:finailtask/util/button_text.dart';
import 'package:finailtask/util/icons.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:finailtask/pages/inpording/slides/slid1.dart';
import 'package:finailtask/pages/inpording/slides/slid2.dart';
import 'package:finailtask/widgets/full_screen_button.dart';
import 'package:finailtask/widgets/tabBarContainer.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class InpordingView extends StatefulWidget {
  const InpordingView({super.key});

  @override
  State<InpordingView> createState() => __OnpordingPagStateState();
}

class __OnpordingPagStateState extends State<InpordingView> {
  int currentSlider = 0;
  CarouselSliderController sliderController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
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
              children: List.generate(4, (index) {
                double width = context.screenWidth * 0.28;
                if (index == 1 || index == 2) {
                  width = (context.screenWidth * 0.28) / 2;
                }
                return Tabbarcontainer(
                  active: index == currentSlider,
                  width: width,
                );
              }),
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
                    setState(() {
                      currentSlider = index;
                    });
                  },
                ),
                carouselController: sliderController,
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: FullScreenButton(
                  onPressed: () {
                    setState(() {
                      if (currentSlider < 3) {
                        currentSlider++;
                        print(currentSlider);
                      } else {
                        currentSlider = 0; // or navigate elsewhere if needed
                      }
                      sliderController.animateToPage(currentSlider);
                    });
                  },
                  icon: currentSlider == 0
                      ? ProjectIcons.arrowRight(
                          color: Colors.white,
                        )
                      : null,
                  inputText: getButtonText(currentSlider),
                  color: context.primaryDark,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
