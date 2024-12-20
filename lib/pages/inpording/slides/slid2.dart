import 'package:finailtask/API/controllers/registration_controller.dart';
import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/pages/inpording/ui_controller/slide2_controller.dart';
import 'package:finailtask/pages/inpording/ui_controller/slider_controller.dart';
import 'package:finailtask/util/phone_number_vaildation.dart';
import 'package:finailtask/widgets/phone_number_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
class Slid2 extends StatelessWidget {
  var controller = Get.put(Slide2Controller());
  var SliderController = Get.put(sliderController());
  RegistrationController registrationController = Get.find();
  Slid2({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enter Your Phone Number",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
                fontFamily: context.fontFamily,
              ),
            ),
            Text(
              "Enter your phone number to verify your identity and the validity of your number to safely activate your account on the platform.",
              style: TextStyle(
                fontSize: 16,
                color: context.fontColor,
                fontFamily: context.fontFamily,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Phone Number",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            PhoneNumberWidget(
              controller: controller.PhoneNumberController,
              onChanged:(value){
                  if(PhoneNumberViolation(value)){
                    controller.PhoneNumberController.text = value;
                    SliderController.isSliderActive(true);
                    SliderController.update();
                    registrationController.phoneNumber(value);
                  }else{
                    SliderController.isSliderActive(false);
                    SliderController.update();
                  }
              },
            ),
          ],
        ),
      ),
    );
  }
}
