import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/pages/projects/widgets/line.dart';
import 'package:flutter/material.dart';

import '../../../widgets/image_holder.dart';

class CourseCertificationWidget extends StatelessWidget {
  final String title;
  final String certificationplace;
  final String imagelink;



   CourseCertificationWidget({super.key,
   required this.title,
   required this.certificationplace,
   required this.imagelink,
   });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImageHolder(link:imagelink,),
       const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                fontFamily: context.fontFamily)),
            SizedBox(
              height: 10,
            ),
            Text(certificationplace,
                style: TextStyle(
                    fontSize: 12,
                    color: context.fontColor)),
            Row(
              children: [ Text('issued in',
                  style: TextStyle(
                      fontSize: 12,
                      color: context.fontColor)),
                const SizedBox(width: 10,),


              ],
            ),
            const SizedBox(height: 5,),
            PageLine(),
          ],
        ),

      ],
    );
  }
}
