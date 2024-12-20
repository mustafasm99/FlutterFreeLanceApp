import 'package:flutter/material.dart';

class PostStatus extends StatelessWidget {
  final String status;
  const PostStatus({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 40,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: status != 'closed' ? Colors.green[100] : Colors.red[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        status != 'closed' ? 'Available' : 'Unavailable',
        style: TextStyle(
          fontSize: 16,
          color: status == 'closed' ? Colors.red[700] : 
          Colors.green[700],
        ),
      ),
    );
  }
}
