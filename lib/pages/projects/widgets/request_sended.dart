import 'package:finailtask/API/controllers/user_controller.dart';
import 'package:finailtask/widgets/titled_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestSended extends StatelessWidget {
  RequestSended({super.key});
  UserController user = UserController();
  int numberOfRequests = 3;

  RxBool isAccepted = false.obs;
  RxBool isRejected = false.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(user.getUser().imageUrl ??
                        "https://s3-alpha-sig.figma.com/img/ad98/1815/00d6f094996ad6500e0e1444e7bb8ae0?Expires=1733097600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=WkfVriZM17SpEj6FyjYQgQeHrWzUhizHmu~Ni50PxffkU79fdLE75ipe3YFIA81ebSrjCMKdfX14zUPAefzRClIP1YVOAXmNcMYTth~3udYdlYB6ZNPaTZ6Jb9l~f45o~xX3ajkR9hFJT5OfE3iDE-sg5vxPG6He9IDPgsiAaNx67vd3GpJqVw8EHnXBDsS4CelzMZ6XGhbSXgZxoHLXUtwBin73k9XDvSKow5a5zKbMm-Agrq-iRJvGpewg-laRbqYbJWVwYZ-2FTdduBnbylBXAjm2LaGpFO~5D-pS25hB0-N876RBus4NvbCWvn~6g2D5W23Bo5LzTaLXsgZ8dA__"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.getUser().name ?? "User Name",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    user.getUser().workTitle ?? "Ui/Ux Designer",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              TitledButton(
                onPressed: () {
                  isAccepted.value = true;
                  isRejected.value = false;
                },
                text: "Accept",
                backGroundColor: const Color(0xFFDDF8E7),
                textColor: Colors.green,
              ),
              const SizedBox(width: 5),
              TitledButton(
                onPressed: () {
                  isRejected.value = true;
                  isAccepted.value = false;
                },
                text: "Decline",
                backGroundColor: const Color(0xFFFFD6D6),
                textColor: Colors.red,
              ),
              
              // TitledButton(onPressed: (){},)
            ],
          ),
          
        ],
      ),
    );
  }
}
