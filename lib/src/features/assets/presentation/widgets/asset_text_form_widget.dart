import 'package:flutter/material.dart';
import 'package:tractian_test/src/core/colors/app_colors_enum.dart';

class AssetTextFormWidget extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController controller;
  final Function(String) onChanged;
  final Function(PointerDownEvent) onTapOutside;
  final Widget? prefixIcon;
  final String? hintText;
  final Widget? suffixIcon;

  const AssetTextFormWidget({
    super.key,
    required this.focusNode,
    required this.controller,
    required this.onChanged,
    required this.onTapOutside,
    this.prefixIcon,
    this.hintText,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      onTapOutside: onTapOutside,
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColorsEnum.neutralGray.color,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
