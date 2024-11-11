import 'package:flutter/material.dart';

class BaseSlidBody extends StatelessWidget {
  final Widget? child;
  const BaseSlidBody({super.key , this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.all(8),
        child: child,
      ),
    );
  }
}