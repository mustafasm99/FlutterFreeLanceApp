import 'package:finailtask/pages/dashbord/controllers/tab_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabBarDashboard extends StatelessWidget {
  TabBarDashboard({super.key});
  var controller = Get.put(TabBarController());
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TabBar(tabs: const [
          Tab(icon: Icon(Icons.directions_car)),
          Tab(icon: Icon(Icons.directions_transit)),
          Tab(icon: Icon(Icons.directions_bike)),
        ],
        controller: controller.tabController,
        ),
      ],
    );
  }
}