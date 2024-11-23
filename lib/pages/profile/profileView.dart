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
                Container(
                    width: 345,
                    height: 192,
                    margin: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFFECF6F9),
                      borderRadius: BorderRadius.circular(
                          15), // Add this line for rounded corners
                    ),
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
                      child: Column(
                        children: [
                          ///Education
                          Row(
                            children: [
                              Text(
                                'Education',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Spacer(),
                              // SvgPicture.asset('SvgIcon/09_add-01.svg'),
                              Icon(Icons.add),
                              SvgPicture.asset('SvgIcon/08_edit-02.svg')
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset('Assets/Image/uni.png'),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('University of Baghdad',
                                      style: TextStyle(
                                          fontSize: 16, fontWeight: FontWeight.bold)),
                                  Text('22 jan 2020 - 11 may 2024.',
                                      style: TextStyle(
                                          fontSize: 12, color: Color(0xff999999))),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Information & Communication\nEngineering, Al-Khwarizmi College',
                                    style: TextStyle(
                                        fontSize: 14, fontWeight: FontWeight.bold),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    )),
                SizedBox(height: 10,),
                ///Skills Container
                Container(
                    width: 345,
                    height: 264,
                    margin: EdgeInsets.only(left: 20),
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
                                  'skills',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                                Spacer(flex: 6,),
                                // SvgPicture.asset('SvgIcon/09_add-01.svg'),
                                Icon(Icons.add),
                                Spacer(),
                                SvgPicture.asset('SvgIcon/08_edit-02.svg'),

                              ],
                            ),
                            SizedBox(height: 20,),

                            ///Skills Rows
                            Row(
                              children: [
                                SvgPicture.asset('SvgIcon/user-multiple-02.svg'),
                                SizedBox(width: 10,),
                                Text('figma (Software)',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
                              ],
                            ),
                            SizedBox(height: 20,),
                            Container(
                              width: 345,
                              height: 1,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Color(0xffD9D9D9),
                                          width: 1
                                      )
                                  )
                              ),
                            ),
                            SizedBox(height: 20,),
                            ///Skills Row
                            Row(
                              children: [
                                SvgPicture.asset('SvgIcon/user-multiple-02.svg'),
                                SizedBox(width: 10,),
                                Text('figma (Software)',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
                              ],
                            ),
                            SizedBox(height: 20,),
                            Container(
                              width: 345,
                              height: 1,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Color(0xffD9D9D9),
                                          width: 1
                                      )
                                  )
                              ),
                            ),
                            SizedBox(height: 20,),

                            ///Skills Row
                            Row(
                              children: [
                                SvgPicture.asset('SvgIcon/user-multiple-02.svg'),
                                SizedBox(width: 10,),
                                Text('figma (Software)',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
                              ],
                            ),

                          ],
                        ))),
                SizedBox(height: 20,),


                ///Course & Certification
                Container(
                  width: 345,
                  height: 400,
                  margin: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    color: Color(0xFFECF6F9),
                    borderRadius: BorderRadius.circular(
                        15), // Add this line for rounded corners
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Course &\nCertification',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Spacer(flex: 6,),
                            // SvgPicture.asset('SvgIcon/09_add-01.svg'),
                            Icon(Icons.add),
                            Spacer(),
                            SvgPicture.asset('SvgIcon/08_edit-02.svg'),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset('Assets/Image/microsoft.png'),
                            SizedBox(width: 20,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Microsoft 365 Certified:\nFudamentals',
                                    style: TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.bold)),
                                SizedBox(height: 10,),
                                Text('Microsoft\nissued in 22 jul 2024',
                                    style: TextStyle(
                                        fontSize: 12, color: Color(0xff999999))),



                              ],
                            ),


                          ],
                        ),
                        SizedBox(height: 20,),
                        Container(
                          width: 345,
                          height: 1,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color(0xffD9D9D9),
                                      width: 1
                                  )
                              )
                          ),
                        ),
                        SizedBox(height: 20,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset('Assets/Image/microsoft.png'),
                            SizedBox(width: 20,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Microsoft 365 Certified:\nFudamentals',
                                    style: TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.bold)),
                                SizedBox(height: 10,),
                                Text('Microsoft\nissued in 22 jul 2024',
                                    style: TextStyle(
                                        fontSize: 12, color: Color(0xff999999))),



                              ],
                            ),


                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}


