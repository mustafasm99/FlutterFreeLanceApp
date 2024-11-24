import 'package:finailtask/pages/dashbord/widgets/card_slider.dart';
import 'package:finailtask/pages/dashbord/project_tab_bar/project_tab_bar.dart';
import 'package:finailtask/pages/dashbord/widgets/task_charts.dart';
import 'package:finailtask/widgets/page_title_widget.dart';
import 'package:finailtask/widgets/template.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../API/controllers/user_controller.dart';

class DashboardView extends StatelessWidget {
  DashboardView({super.key});
  UserController user = Get.find(); // the current user

 
  @override
  Widget build(BuildContext context) {
     var userType = user.getUser().userType;
    return Template(
      freeSpace: PageTitle(
        title: userType ?? "Dashboard",
        ),
      child: 
      Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10 , left: 10 , right: 10),
              padding: const EdgeInsets.all(0),
              child:const DashboardCardSlider(),
            ),
            const DashboardTaskCharts(),
            const ProjectTabBar()
          ],
        ),
      )
    );
  }
}