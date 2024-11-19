import 'package:cached_network_image/cached_network_image.dart';
import 'package:finailtask/API/models/auth/user.dart';
import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:flutter/material.dart';

class UserNotifications extends StatelessWidget {
  final Users user;
  String comment = "commented on your post";
  final bool isRead;
  UserNotifications({super.key, required this.user ,required this.isRead});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 10),
      margin: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        border:
            Border(bottom: BorderSide(color: Colors.grey.shade300, width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          isRead ? Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: context.primaryColor,
              shape: BoxShape.circle,
            ),
          ) :
          Container(),
          const SizedBox(width: 5),
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: CachedNetworkImageProvider(user.imageUrl ??
                        "https://s3-alpha-sig.figma.com/img/2e9f/7448/8d9cf28f18dc98146be5c5ce21be0c23?Expires=1733097600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=S~RzJwFRncWiGLoBSCAfIyYLNATWrX7-dUPVU7EcJvLsDEBkU~51zxyGOsiliNaDqqW8SZQqKm1tcDyF4l~1sAYGkaP8LgKFxxg2d0HGmLGox7wOrW20gFS0keuRZ4LP~OQ~CpuJUrtdneRdsMwQv-~MLWwmBkyzQw2rsWps7Vo5BKYyK6yFUEOKSWS0sYYBZdNXNNCMDe-ENjEIv9yqrFU5h6oTqD4fZSyMZYgdQuIC7bfQOPojl8F1TEjIqUx2hIHDNtMR4TVYdpUcD068O24jObDenJRFc2~k7wHgI~S5dGBUsbw16OS44u0YWIZNSxm68yIthnJ6rkQ89OVUEQ__"),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(width: 5),
          Text(
            user.name ?? "User",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold , color:context.primaryColor),
          ),
          const SizedBox(width: 5),
          Text(
            comment,
            style:const TextStyle(fontSize: 16),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
