import 'package:carousel_slider/carousel_slider.dart';
import 'package:finailtask/pages/dashbord/slider_item.dart';
import 'package:flutter/material.dart';

class DashboardCardSlider extends StatelessWidget {
  const DashboardCardSlider({super.key});

  @override
  Widget build(BuildContext context) {
    CarouselSliderController dashboardSliderController = CarouselSliderController();

    return CarouselSlider(
      items: const [
        DashboardSliderItem(title: "Total Projects" , counter: 10),
        DashboardSliderItem(title: "Pending" , counter: 3),
        DashboardSliderItem(title: "In Progress" , counter: 5),
        DashboardSliderItem(title: "Done" , counter: 2),
      ],
      options: CarouselOptions(
        enlargeCenterPage: true,
        viewportFraction: 0.6,
        aspectRatio: 4,
        height: 120,
        enableInfiniteScroll: false,
        initialPage: 0,
        padEnds: false,
        scrollPhysics: const BouncingScrollPhysics(),
        pageSnapping: true,
        disableCenter: true,
        
      ),
      carouselController: dashboardSliderController,
    );
  }
}