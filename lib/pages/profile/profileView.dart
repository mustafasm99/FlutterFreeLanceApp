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
    return Template(
      freeSpace: const PageTitle(title: "Profile"),
      child: Center(
        child: Obx(() => ListView(
              children: [
                const ProfileImage(),
                ProfileBio(),
                FutureBuilder(
                  future: ProfileController().getProfile(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      ProfileModel profile = snapshot.data as ProfileModel;
                      return ProfileProjectHistory(
                        projects: profile.projects,
                      );
                    }
                  },
                ),
              ],
            )),
      ),
    );
  }
}


