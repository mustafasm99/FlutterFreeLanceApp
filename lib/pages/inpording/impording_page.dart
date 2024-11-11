import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:finailtask/pages/inpording/slides/slid1.dart';
import 'package:finailtask/pages/inpording/slides/slid2.dart';
import 'package:finailtask/widgets/full_screen_button.dart';
import 'package:finailtask/widgets/tabBarContainer.dart';

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
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(top: 20),
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(3, (index) {
                return Tabbarcontainer(
                  active: index == currentSlider,
                );
              }),
            ),
            SizedBox(
              height: 500,
              child: CarouselSlider(
                items: [
                  Slid1(),
                  const Slid2(),
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
            FullScreenButton(
              onPressed: () {
                setState(() {
                  if (currentSlider < 2) {
                    currentSlider++;
                  } else {
                    currentSlider = 0; // or navigate elsewhere if needed
                  }
                  sliderController.animateToPage(currentSlider);
                });
              },
              icon: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 20,
              ),
              inputText: "Next",
              color: Colors.blue[200]!,
            ),
          ],
        ),
      ),
    );
  }
}
