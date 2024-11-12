import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/pages/inpording/ui_controller/slide2_controller.dart';
import 'package:finailtask/pages/inpording/ui_controller/slider_controller.dart';
import 'package:finailtask/util/icons.dart';
import 'package:finailtask/widgets/otp_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:timer_count_down/timer_controller.dart';

class Slid3 extends StatelessWidget {
  Slid3({super.key});
  Slide2Controller controller = Get.put(Slide2Controller());
  var SliderController = Get.put(sliderController());
  CountdownController countdownController = CountdownController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.all(8),
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Verify Phone Number",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
                fontFamily: context.fontFamily,
              ),
            ),
            Text(
              "Enter the verification code sent to +964${controller.PhoneNumberController.text} via WhatsApp",
              style: TextStyle(
                fontSize: 16,
                color: context.fontColor,
                fontFamily: context.fontFamily,
              ),
            ),
            const SizedBox(height: 20),
            OtpInput(
              controller: controller.OtpController,
              onChanged: (value) {
                if (value.length == 6) {
                  SliderController.isSliderActive(true);
                } else {
                  SliderController.isSliderActive(false);
                }
              },
            ),
            const SizedBox(height: 30),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProjectIcons.clock(color: context.primaryColor),
                  const SizedBox(
                    width: 5,
                  ),
                  Countdown(
                    controller: countdownController, // To Control the Countdown
                    seconds: 10,
                    onFinished: () {
                      countdownController.isCompleted = true;
                    },
                    build: (BuildContext context, double time) {
                      countdownController.start();
                      return Text(
                        "00:${time.toInt()}",
                        style: TextStyle(
                          fontSize: 20,
                          color: context.primaryColor,
                          fontFamily: context.fontFamily,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive the code?",
                    style: TextStyle(
                      fontSize: 16,
                      color: context.fontColor,
                      fontFamily: context.fontFamily,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (countdownController.isCompleted == true)
                          {
                            countdownController.isCompleted = false;
                            countdownController.restart();
                          }
                    },
                    child: Text(
                      "Resend",
                      style: TextStyle(
                        fontSize: 16,
                        color: context.primaryColor,
                        fontFamily: context.fontFamily,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
