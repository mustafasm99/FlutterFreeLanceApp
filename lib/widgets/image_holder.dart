import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageHolder extends StatelessWidget {
  final String link;
  final double? height, width;
  const ImageHolder(
      {super.key, required this.link, this.height = 50, this.width = 50});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: CachedNetworkImageProvider(link),
        ),
      ),
    );
  }
}
