import 'package:carousel_slider/carousel_slider.dart';
import 'package:finailtask/pages/inpording/slides/slid1.dart';
import 'package:finailtask/pages/inpording/slides/slid2.dart';
import 'package:finailtask/widgets/full_screen_button.dart';
import 'package:finailtask/widgets/tabBarContainer.dart';
import 'package:flutter/material.dart';
// import 'package:get/get_navigation/src/routes/default_transitions.dart';

class InpordingView extends StatefulWidget {
  const InpordingView({super.key});

  @override
  State<InpordingView> createState() => __OnpordingPagStateState();
}

class __OnpordingPagStateState extends State<InpordingView> {
  int currentSlider = 0;
  CarouselSliderController sliderController = CarouselSliderController();
  int step = 0;
  List<Tabbarcontainer>  tabBarsContainers = [
    const Tabbarcontainer(active: true),
    const Tabbarcontainer(active: false),
    const Tabbarcontainer(active: false),
  ];

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
            SizedBox(
              height: 70,
              width: double.infinity,
              child: CarouselSlider(
                items: tabBarsContainers,
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
            SizedBox(
              height: 500,
              child: CarouselSlider(
                items: const [
                  Slid1(),
                  Slid2(),
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
              onPressed: (){
                sliderController.animateToPage(2);
              }, 
              icon: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 20,
              ), 
              inputText: "Next", 
              color: Colors.blue[200]!
            )
          ],
        ),
      ),
    );
  }
}
