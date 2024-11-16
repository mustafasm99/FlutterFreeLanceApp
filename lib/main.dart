import 'package:finailtask/API/controllers/user_controller.dart';
import 'package:finailtask/pages/inpording/impording_page.dart';
import 'package:finailtask/router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:finailtask/themes/mainTheme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() {
  Get.put(UserController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          theme: mainTheme,
          initialRoute: '/',
          getPages: AppPages.pages,
          home: const InpordingView(),
        );
      },
    );
  }
}
