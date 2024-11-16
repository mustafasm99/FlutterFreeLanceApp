import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabBarController extends StatefulWidget {
  @override
  _TabBarControllerState createState() => _TabBarControllerState();
}

class _TabBarControllerState extends State<TabBarController> with SingleTickerProviderStateMixin {
  late TabController  tabController;
  var tabIndex = 0.obs;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void changeTabIndex(int index) {
    setState(() {
      tabIndex.value = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(); // Replace with your widget
  }
}