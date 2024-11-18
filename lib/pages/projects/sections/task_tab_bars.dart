import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:flutter/material.dart';

class TaskTabBars extends StatelessWidget {
  const TaskTabBars({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: context.primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: ButtonsTabBar(
                  backgroundColor: context.primaryDark,
                  radius: 20,
                  contentCenter: true,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  labelSpacing: 25,
                  unselectedBackgroundColor:
                      context.primaryColor.withOpacity(0.1),
                  unselectedBorderColor: context.primaryColor.withOpacity(0.3),
                  labelStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  tabs: const [
                    Tab(
                      text: "All Tasks",
                    ),
                    Tab(
                      text: "My Tasks",
                    ),
                    Tab(
                      text: "In Review",
                    ),
                    Tab(
                      text: "Completed",
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 300,
              child: const TabBarView(
                children: [
                  Center(
                    child: Text("All Tasks"),
                  ),
                  Center(
                    child: Text("My Tasks"),
                  ),
                  Center(
                    child: Text("In Review"),
                  ),
                  Center(
                    child: Text("Completed"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
