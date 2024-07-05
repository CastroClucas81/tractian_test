import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonItemWidget extends StatelessWidget {
  final double width;
  final double height;
  final double? borderRadius;
  final EdgeInsets? margin;

  const SkeletonItemWidget({
    required this.width,
    required this.height,
    this.borderRadius,
    this.margin,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        margin: margin,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
        ),
      ),
    );
  }
}
