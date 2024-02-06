import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../generated/assets.dart';

class CircleImage extends StatefulWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final String errorAssetPath;

  const CircleImage({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.errorAssetPath = Assets.imagesPerson,
  }) : super(key: key);

  @override
  State<CircleImage> createState() => _CircleImageState();
}

class _CircleImageState extends State<CircleImage> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(1000.0),
      child: CachedNetworkImage(
        alignment: Alignment.topCenter,
        imageUrl: widget.imageUrl.toString(),
        width: widget.width ?? 5.h,
        height: widget.height ?? 5.h,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          width: widget.width ?? 5.h,
          height: widget.height ?? 5.h,
        ),
        errorWidget: (context, url, error) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(1000.0),
            child: Image.asset(
              height: widget.height == null ? 5.h : widget.height!,
              width: widget.width == null ? 5.h : widget.width!,
              widget.errorAssetPath,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
