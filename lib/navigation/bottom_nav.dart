import 'package:finailtask/extentions/sizeing.dart';
import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/navigation/ui_controller/nav_controller.dart';
import 'package:finailtask/util/icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBottomNavigationBar extends StatelessWidget {
  AppBottomNavigationBar({super.key});
  var controller = Get.put(NavController());

  void _onItemTapped(int index) {
    controller.currentPage.value = index;
    switch (index) {
      case 0:
        controller.currentPage.value = 0;
        Get.toNamed('/feed');
        break;
      case 1:
        controller.currentPage.value = 1;
        Get.toNamed('/dashboard');
        break;
      case 2:
        controller.currentPage.value = 2;
        Get.toNamed('/profile');
        break;
      case 3:
        controller.currentPage.value = 3;
        Get.toNamed('/settings');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      padding: const EdgeInsets.symmetric(horizontal: 0),
      color: Colors.transparent,
      child: Obx(() {
        return Stack(
          children: [
            CustomPaint(
              size: Size(context.screenWidth, 75),
              painter: BottomNavigationBarPinter(
                color: context.primaryColor,
              ),
            ),
            Container(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: context.screenWidth * 0.35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () => _onItemTapped(0),
                              icon: ProjectIcons.home(
                                color: controller.currentPage.value == 0
                                    ? context.activeNavIcon
                                    : Colors.white,
                                size: 30,
                              ),
                            ),
                            Text(
                              "Home",
                              style: TextStyle(
                                  color: controller.currentPage.value == 0
                                      ? context.activeNavIcon
                                      : Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () => _onItemTapped(1),
                              icon: ProjectIcons.dashboardSquareEdit(
                                color: controller.currentPage.value == 1
                                    ? context.activeNavIcon
                                    : Colors.white,
                                size: 30,
                              ),
                            ),
                            Text(
                              "Dashboard",
                              style: TextStyle(
                                  color: controller.currentPage.value == 1
                                      ? context.activeNavIcon
                                      : Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: context.screenWidth * 0.35,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () => _onItemTapped(2),
                                icon: ProjectIcons.userCircle(
                                  color: controller.currentPage.value == 2
                                      ? context.activeNavIcon
                                      : Colors.white,
                                  size: 30,
                                ),
                              ),
                              Text(
                                "Profile",
                                style: TextStyle(
                                    color: controller.currentPage.value == 2
                                        ? context.activeNavIcon
                                        : Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () => _onItemTapped(3),
                                icon: ProjectIcons.settings(
                                  color: controller.currentPage.value == 3
                                      ? context.activeNavIcon
                                      : Colors.white,
                                  size: 30,
                                ),
                              ),
                              Text(
                                "Settings",
                                style: TextStyle(
                                    color: controller.currentPage.value == 3
                                        ? context.activeNavIcon
                                        : Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}

class BottomNavigationBarPinter extends CustomPainter {
  final Color color;

  BottomNavigationBarPinter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 0);
    path.quadraticBezierTo(0, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.4, 0, size.width * 0.42, 20);
    path.arcToPoint(
      Offset(size.width * 0.58, 20),
      radius: const Radius.circular(35.0),
      clockwise: false,
    );
    path.quadraticBezierTo(size.width * 0.6, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
