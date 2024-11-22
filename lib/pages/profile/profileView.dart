import 'package:finailtask/API/controllers/profile_controller.dart';
import 'package:finailtask/API/controllers/user_controller.dart';
import 'package:finailtask/API/models/profile/profile_model.dart';
import 'package:finailtask/pages/profile/controllers/bio_controler.dart';
import 'package:finailtask/pages/profile/widgets/profile_bio.dart';
import 'package:finailtask/pages/profile/widgets/profile_image.dart';
import 'package:finailtask/pages/profile/widgets/profile_project_history.dart';
import 'package:finailtask/widgets/page_title_widget.dart';
import 'package:finailtask/widgets/template.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});
  UserController get userController => Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => BioController(
        bio:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec purus feugiat, molestie ipsum et, varius nunc. Nulla facilisi. Nullam et nunc auctor, tincidunt felis ac, tincidunt nunc. Nulla facilisi. Nullam et nunc auctor, tincidunt felis ac, tincidunt nunc."));

    return Template(
      freeSpace: const PageTitle(title: "Profile"),
      child: Center(
        child: Obx(
          () => FutureBuilder<ProfileModel>(
            future: ProfileController().getProfile(),
            builder: (context, snapshot) {
              print(snapshot.data!.projects);
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else {
                return ListView(
                  children: [
                    const ProfileImage(),
                    ProfileBio(),
                  ProfileProjectHistory(projects: snapshot.data!.projects,),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
