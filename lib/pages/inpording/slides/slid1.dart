import 'package:flutter/material.dart';

class UserTypeContainer extends StatefulWidget {
  final Widget icon;
  final String title;
  final String descrption;
  final bool isSelected;
  final VoidCallback onTap;

  const UserTypeContainer({
    Key? key,
    required this.icon,
    required this.title,
    required this.descrption,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  _UserTypeContainerState createState() => _UserTypeContainerState();
}

class _UserTypeContainerState extends State<UserTypeContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: widget.isSelected ? Colors.red : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Color(0xFFBFBFBF),
          ),
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 20,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              widget.icon,
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                  Text(
                    widget.descrption,
                    style: const TextStyle(
                      color: Colors.black26
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Slid1 extends StatefulWidget {
  const Slid1({super.key});

  @override
  _Slid1State createState() => _Slid1State();
}

class _Slid1State extends State<Slid1> {
  String? selectedOption;

  void _selectOption(String option) {
    setState(() {
      selectedOption = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top:20 , bottom: 20 ),
      height: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Lets Get Started!",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 1,
          ),
          const Text("How do you plan to use this platform"),
          UserTypeContainer(
            icon: const Icon(
              Icons.person,
              size: 30,
            ),
            title: "Freelance",
            descrption: "I’m a freelancer ready to work for projects",
            isSelected: selectedOption == "Freelance",
            onTap: () => _selectOption("Freelance"),
          ),
          UserTypeContainer(
            icon: const Icon(
              Icons.person,
              size: 30,
            ),
            title: "Client",
            descrption: "I’m a client searching for talented freelancers",
            isSelected: selectedOption == "Client",
            onTap: () => _selectOption("Client"),
          ),
        ],
      ),
    );
  }
}
