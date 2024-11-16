import 'package:finailtask/pages/dashbord/search_section.dart';
import 'package:finailtask/pages/dashbord/tab_bar_dashboard.dart';
import 'package:finailtask/widgets/template.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Template(child: 
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const DashboardSearchSection(),
            TabBarDashboard(),
          ],
        ),
      ),
    );
  }
}