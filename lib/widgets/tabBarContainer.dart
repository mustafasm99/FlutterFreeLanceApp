import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class Tabbarcontainer extends StatelessWidget {
  final bool active;
  const Tabbarcontainer({
    Key? key,
    required this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.28,
      height: 8,
      decoration: BoxDecoration(
        color: active ? Colors.red : Colors.black45,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
