import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/pages/dashbord/project_tab_bar/projcet_bars/bar_container.dart';
import 'package:flutter/material.dart';

class ProjectTabBar extends StatelessWidget {
  const ProjectTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(0),
      child: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            ButtonsTabBar(
              backgroundColor: context.primaryColor,
              radius: 20,
              splashColor: context.primaryColor,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              labelStyle: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelStyle: TextStyle(
                  color: context.fontColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              tabs: const [
                Tab(text: "All"),
                Tab(text: "Pending"),
                Tab(text: "In Progress"),
                Tab(text: "Completed"),
              ],
            ),
            Container(
              height: 200,
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(0),
              child: const TabBarView(
                children: [
                  ProjectsBarContentContainer(), // make it take data from the backend filter by all
                  ProjectsBarContentContainer(), // make it take data from the backend filter by pending
                  ProjectsBarContentContainer(), // make it take data from the backend filter by in progress
                  ProjectsBarContentContainer(), // make it take data from the backend filter by completed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
