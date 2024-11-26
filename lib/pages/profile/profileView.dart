import 'package:cached_network_image/cached_network_image.dart';
import 'package:finailtask/API/controllers/profile_controller.dart';
import 'package:finailtask/API/controllers/user_controller.dart';
import 'package:finailtask/API/models/profile/profile_model.dart';
import 'package:finailtask/pages/profile/controllers/bio_controler.dart';
import 'package:finailtask/pages/profile/widgets/course_certification_widget.dart';
import 'package:finailtask/pages/profile/widgets/profile_bio.dart';
import 'package:finailtask/pages/profile/widgets/profile_image.dart';
import 'package:finailtask/pages/profile/widgets/profile_project_history.dart';
import 'package:finailtask/pages/profile/widgets/educations_widgets.dart';
import 'package:finailtask/pages/profile/widgets/skills_widget.dart';
import 'package:finailtask/pages/projects/widgets/line.dart';
import 'package:finailtask/pages/profile/widgets/section_holder.dart';
import 'package:finailtask/util/icons.dart';
import 'package:finailtask/widgets/image_holder.dart';
import 'package:finailtask/widgets/page_title_widget.dart';
import 'package:finailtask/widgets/template.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});
  UserController get userController => Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    var userType = userController.getUser().userType;
    return Template(
      freeSpace: const PageTitle(title: "Profile"),
      child: Center(
        child: Obx(
          () => ListView(
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
              userType == "CLIENT"
                  ? const SizedBox()
                  : Column(
                      children: [
                        ///Education
                        SectionHolder(
                          title: "Education",
                          onAdd: () {},
                          onEdit: () {},
                          children: [
                            EducationsWidgets(
                              imageLink:
                                  "https://s3-alpha-sig.figma.com/img/87a3/f739/8a683f0d1dbfae16ae4b9fad5f9e2e20?Expires=1733097600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=jGioJTdgGeA7UmAio8R9MZj5d1xqQZE0HI48nPqsJDqK1FpQKcUJkf9quMhHEfaJ6B1G1RFIyoYYoP15zXOvWHeoqrOT7xpz9aR-5EWau7RbuKqIBPB9~uGZq~NIU4gtqDrmlhkpmv8D8K7PFvdBLzJ8mfZbrmLznGVMNAWEril~E0MiIW-hgcj5btcVpWCoNeqbNrP1p7aebWbxqkNlVdcAhTaQ6FnnQh1GOT4icPgnLwyEPSnGEdLBVpUrVSMlcW7nHX6k00a2F16L3mz-ZjtGLL6c3kWbFe71dVphj-qzbr7G~R0kIc5pDvcAYdlWTSVnDsxhnDaKhUan8opXFA__",
                              title: "University of Baghdad",
                              description: "Bachelor of Computer Science",
                              startDate: DateTime(2021, 1, 1),
                              endDate: DateTime.now(),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        ///Skills///

                        SectionHolder(
                            title: 'Skills',
                            onAdd: () {},
                            onEdit: () {},
                            children: [
                              SkillsWidget(
                                title: 'Figma (Software)',
                              ),
                              SkillsWidget(
                                title: 'Adobe illustrator (Software)',
                              ),
                              SkillsWidget(
                                title: 'Figma (Software)',
                              ),
                            ]),

                        const SizedBox(
                          height: 20,
                        ),

                        ///Course & Certification///
                      
                      SectionHolder(title: 'Course %\nCrtification', onAdd: (){}, onEdit: (){}, children: [CourseCertificationWidget(title: 'Microsoft', certificationplace: 'Microsoft', imagelink: 'https://www.figma.com/file/74GOmTQnKKMAM0TdKbRfjp/image/11368974bb8bd11f43d134c06a23c0afb7385281')])
                        
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
