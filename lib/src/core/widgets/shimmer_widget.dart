import 'package:flutter/material.dart';
import 'package:tractian_test/src/core/colors/app_colors_enum.dart';

class ShimmerWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  final double? borderRadius;

  const ShimmerWidget({
    super.key,
    this.height,
    this.width,
    this.color,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color ?? AppColorsEnum.gray.color.withOpacity(0.8),
        borderRadius:
            borderRadius != null ? BorderRadius.circular(borderRadius!) : null,
      ),
    );
  }
}
