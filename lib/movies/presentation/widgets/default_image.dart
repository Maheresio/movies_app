import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DefaultImage extends StatelessWidget {
  final double height;
  final String image;
  const DefaultImage({
    super.key,
    required this.height,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      child: CachedNetworkImage(
        fit: BoxFit.fill,
        imageUrl: image,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
