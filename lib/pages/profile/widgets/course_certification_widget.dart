import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/pages/projects/widgets/line.dart';
import 'package:flutter/material.dart';

import '../../../widgets/image_holder.dart';

class CourseCertificationWidget extends StatelessWidget {
  final String title;
  final String certificationPlace;
  final String imageLink;
  final String issuedDate;

  CourseCertificationWidget({
    super.key,
    required this.title,
    required this.certificationPlace,
    required this.imageLink,
    required this.issuedDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
       padding: const EdgeInsets.symmetric(horizontal: 10),
       margin: const EdgeInsets.symmetric(vertical: 10 , horizontal: 20),
       child: Row(
        children: [
          ImageHolder(
            link : imageLink,
            width: 100,
            height: 100,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 20,
                fontFamily: context.fontFamily),
              ),
              Text(
                certificationPlace,
                style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 15,
                fontFamily: context.fontFamily),
              ),
              Text(
                "issued in $issuedDate",
                style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 15,
                fontFamily: context.fontFamily),
              ),
            ],
          ),
        ],
       ),
    );
  }
}
