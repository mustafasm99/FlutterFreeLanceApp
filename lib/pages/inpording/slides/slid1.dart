import 'package:finailtask/API/controllers/registration_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:finailtask/util/icons.dart';
import 'package:finailtask/pages/inpording/ui_controller/slider_controller.dart';

class UserTypeContainer extends StatelessWidget {
  final Widget icon;
  final String title;
  final String description;
  final bool isSelected;
  final VoidCallback onTap;

  const UserTypeContainer({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? context.theme.primaryColor : Color(0xFFBFBFBF),
          ),
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 20,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon,
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      description,
                      style: const TextStyle(color: Colors.black26),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Slid1 extends StatelessWidget {
  final sliderController _controller = Get.put(sliderController());
  RegistrationController registrationController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      height: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Let's Get Started!",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text("How do you plan to use this platform"),
          Obx(
            () => UserTypeContainer(
              icon: ProjectIcons.user(
                  color: _controller.selectedOption.value == "Freelance"
                      ? Theme.of(context).colorScheme.primary
                      : Colors.black),
              title: "Freelance",
              description: "I’m a freelancer ready to work for projects",
              isSelected: _controller.selectedOption.value == "Freelance",
              onTap: (){
                _controller.selectedOption("Freelance");
                _controller.isSliderActive(true);
                registrationController.userType.value = "FREELANCER";
              },
            ),
          ),
          Obx(
            () => UserTypeContainer(
              icon: ProjectIcons.userSearch(
                  color: _controller.selectedOption.value == "Client"
                      ? Theme.of(context).colorScheme.primary
                      : Colors.black),
              title: "Client",
              description: "I’m a client searching for talented freelancers",
              isSelected: _controller.selectedOption.value == "Client",
              onTap: (){
                _controller.selectedOption("Client");
                _controller.isSliderActive(true);
                registrationController.userType.value = "CLIENT";
              },
            ),
          ),
          Obx(
            () => UserTypeContainer(
              icon: ProjectIcons.userSearch(
                  color: _controller.selectedOption.value == "Client"
                      ? Theme.of(context).colorScheme.primary
                      : Colors.black),
              title: "Have in Account",
              description: "I’m a client or freelancer with an account",
              isSelected: _controller.selectedOption.value == "Client",
              onTap: (){
                Get.toNamed("/login");
              },
            ),
          ),
        ],
      ),
    );
  }
}
