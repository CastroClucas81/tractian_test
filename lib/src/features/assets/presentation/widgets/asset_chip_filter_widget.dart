import 'package:flutter/material.dart';
import 'package:tractian_test/src/core/assets/icons_enum.dart';
import 'package:tractian_test/src/core/colors/app_colors_enum.dart';

class AssetChipFilterWidget extends StatelessWidget {
  final String title;
  final IconsEnum icone;
  final bool isSelected;
  final VoidCallback onTap;

  const AssetChipFilterWidget({
    required this.title,
    required this.icone,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  Color get _color =>
      isSelected ? AppColorsEnum.white.color : AppColorsEnum.bodyText.color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Chip(
        onDeleted: isSelected ? onTap : null,
        deleteIconColor: _color,
        avatar: Image.asset(
          icone.path,
          height: 16,
          width: 16,
          fit: BoxFit.cover,
          color: _color,
        ),
        backgroundColor: isSelected
            ? AppColorsEnum.lightBlue.color
            : AppColorsEnum.neutralGray.color,
        label: Text(
          title,
          style: TextStyle(color: _color),
        ),
      ),
    );
  }
}
