import 'package:cached_network_image/cached_network_image.dart';
import 'package:finailtask/API/controllers/profile_controller.dart';
import 'package:finailtask/API/controllers/user_controller.dart';
import 'package:finailtask/API/models/profile/profile_model.dart';
import 'package:finailtask/pages/profile/controllers/bio_controler.dart';
import 'package:finailtask/pages/profile/widgets/profile_bio.dart';
import 'package:finailtask/pages/profile/widgets/profile_image.dart';
import 'package:finailtask/pages/profile/widgets/profile_project_history.dart';
import 'package:finailtask/pages/projects/widgets/educations_widgets.dart';
import 'package:finailtask/pages/projects/widgets/line.dart';
import 'package:finailtask/pages/projects/widgets/section_holder.dart';
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
              Column(
                children: [
                  ///Education
                  SectionHolder(
                    title: "Education",
                    onAdd: () {},
                    onEdit: () {},
                    child: EducationsWidgets(
                      imageLink:
                          "https://s3-alpha-sig.figma.com/img/1136/8974/bb8bd11f43d134c06a23c0afb7385281?Expires=1733097600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=ZH0O5KAwQ7oFTbq84FMMcxQ5iPJa1Tzx6pSQLC9ze62l7RV~nL0uy8QAM4tsG6AsjVlurnDirGLpph5TJ5W93IOfEndf2X5x9uK1nzU4gaXH33tec5bUrexql2aAIMkCMcm-jBEv8Uzlg2ZJ7YFjfWhPIBOy3r7IXTsTIiIhdQf1jivjv9gyN4TvtcHVtBuctVGLCnVXIikQY-jaepy-qSe2vlpWGaX6NPbERHjRZFa2e70Py9gGBpmnQEXV2LKwSW49W0WAtmHDcefOuFlTOHoHabY8F2lpvkaphIsA3D0HkAMdSu6GcVviIhnQ3bJukzCcVGLpy3kWGSoiKgwqDw__",
                      title: "University of Baghdad",
                      description: "Bachelor of Computer Science",
                      startDate: DateTime(2021, 1, 1),
                      endDate: DateTime.now(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  ///Skills Container
                  Container(
                    width: 345,
                    height: 264,
                    margin: const EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFECF6F9),
                      borderRadius: BorderRadius.circular(
                          15), // Add this line for rounded corners
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Text(
                                'skills',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              const Spacer(
                                flex: 2,
                              ),
                              // SvgPicture.asset('SvgIcon/09_add-01.svg'),
                              const Icon(Icons.add),
                              const Spacer(),
                              ProjectIcons.edit(),
                            ],
                          ),
                          const SizedBox(height: 20),

                          ///Skills Rows
                          Row(
                            children: [
                              ProjectIcons.multipleUsers(),
                              const SizedBox(width: 10),
                              const Text(
                                'figma (Software)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          const PageLine(),
                          const SizedBox(height: 10),

                          ///Skills Row
                          Row(
                            children: [
                              ProjectIcons.multipleUsers(),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'figma (Software)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const PageLine(),
                          const SizedBox(
                            height: 10,
                          ),

                          ///Skills Row
                          Row(
                            children: [
                              ProjectIcons.multipleUsers(),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'figma (Software)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  ///Course & Certification
                  Container(
                    width: 345,
                    height: 400,
                    margin: const EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFFECF6F9),
                      borderRadius: BorderRadius.circular(
                          15), // Add this line for rounded corners
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Course &\nCertification',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Spacer(
                                flex: 6,
                              ),
                              // SvgPicture.asset('SvgIcon/09_add-01.svg'),
                              Icon(Icons.add),
                              Spacer(),
                              ProjectIcons.edit(),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ImageHolder(
                                  link:
                                      "https://s3-alpha-sig.figma.com/img/87a3/f739/8a683f0d1dbfae16ae4b9fad5f9e2e20?Expires=1733097600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=jGioJTdgGeA7UmAio8R9MZj5d1xqQZE0HI48nPqsJDqK1FpQKcUJkf9quMhHEfaJ6B1G1RFIyoYYoP15zXOvWHeoqrOT7xpz9aR-5EWau7RbuKqIBPB9~uGZq~NIU4gtqDrmlhkpmv8D8K7PFvdBLzJ8mfZbrmLznGVMNAWEril~E0MiIW-hgcj5btcVpWCoNeqbNrP1p7aebWbxqkNlVdcAhTaQ6FnnQh1GOT4icPgnLwyEPSnGEdLBVpUrVSMlcW7nHX6k00a2F16L3mz-ZjtGLL6c3kWbFe71dVphj-qzbr7G~R0kIc5pDvcAYdlWTSVnDsxhnDaKhUan8opXFA__"),
                              SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Microsoft 365 Certified:\nFudamentals',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Microsoft\nissued in 22 jul 2024',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff999999))),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 345,
                            height: 1,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Color(0xffD9D9D9), width: 1))),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ImageHolder(
                                  link:
                                      "https://s3-alpha-sig.figma.com/img/1136/8974/bb8bd11f43d134c06a23c0afb7385281?Expires=1733097600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=ZH0O5KAwQ7oFTbq84FMMcxQ5iPJa1Tzx6pSQLC9ze62l7RV~nL0uy8QAM4tsG6AsjVlurnDirGLpph5TJ5W93IOfEndf2X5x9uK1nzU4gaXH33tec5bUrexql2aAIMkCMcm-jBEv8Uzlg2ZJ7YFjfWhPIBOy3r7IXTsTIiIhdQf1jivjv9gyN4TvtcHVtBuctVGLCnVXIikQY-jaepy-qSe2vlpWGaX6NPbERHjRZFa2e70Py9gGBpmnQEXV2LKwSW49W0WAtmHDcefOuFlTOHoHabY8F2lpvkaphIsA3D0HkAMdSu6GcVviIhnQ3bJukzCcVGLpy3kWGSoiKgwqDw__"),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Microsoft 365 Certified:\nFudamentals',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Microsoft\nissued in 22 jul 2024',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff999999))),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// Todo : Add the following widgets to the ProfileView: