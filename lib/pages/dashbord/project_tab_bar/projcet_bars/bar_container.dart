import 'package:finailtask/pages/dashbord/widgets/project_card.dart';
import 'package:flutter/material.dart';

class ProjectsBarContentContainer extends StatelessWidget {
  const ProjectsBarContentContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
          ProjectCard(title: "title", status: "Pending", percentage: 20 , id: 1,)
      ],
    );
  }
}