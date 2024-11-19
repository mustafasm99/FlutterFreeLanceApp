import 'package:finailtask/API/models/auth/user.dart';
import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/pages/notifications/widgets/user_notifications.dart';
import 'package:finailtask/widgets/page_title_widget.dart';
import 'package:finailtask/widgets/template.dart';
import 'package:flutter/material.dart';

class NotificationsView extends StatelessWidget {
  NotificationsView({super.key});
  final Users user = Users(
    name: "Zainab Saad",
    imageUrl:
        "https://s3-alpha-sig.figma.com/img/2e9f/7448/8d9cf28f18dc98146be5c5ce21be0c23?Expires=1733097600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=S~RzJwFRncWiGLoBSCAfIyYLNATWrX7-dUPVU7EcJvLsDEBkU~51zxyGOsiliNaDqqW8SZQqKm1tcDyF4l~1sAYGkaP8LgKFxxg2d0HGmLGox7wOrW20gFS0keuRZ4LP~OQ~CpuJUrtdneRdsMwQv-~MLWwmBkyzQw2rsWps7Vo5BKYyK6yFUEOKSWS0sYYBZdNXNNCMDe-ENjEIv9yqrFU5h6oTqD4fZSyMZYgdQuIC7bfQOPojl8F1TEjIqUx2hIHDNtMR4TVYdpUcD068O24jObDenJRFc2~k7wHgI~S5dGBUsbw16OS44u0YWIZNSxm68yIthnJ6rkQ89OVUEQ__",
  );

  @override
  Widget build(BuildContext context) {
    return Template(
      freeSpace: PageTitle(title: "Notifications"),
      child: SingleChildScrollView(
        child: Container(
          padding:
              const EdgeInsets.only(top: 2, left: 10, right: 10, bottom: 10),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "You have 3",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "Notifications",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: context.primaryColor,
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Text("Today!"),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 300, // Specify a fixed height or dynamic height
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return UserNotifications(
                      user: user,
                      isRead: index % 2 == 0,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
