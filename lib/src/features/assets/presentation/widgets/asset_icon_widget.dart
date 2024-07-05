import 'package:flutter/material.dart';
import 'package:tractian_test/src/core/assets/icons_enum.dart';
import 'package:tractian_test/src/features/assets/domain/entities/asset_entity.dart';

class AssetIconWidget extends StatelessWidget {
  final AssetEntity item;

  const AssetIconWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (item.isCritic)
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Image.asset(
              IconsEnum.alert.path,
              width: 16,
              height: 16,
            ),
          ),
        if (item.isEnergySensor)
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Image.asset(
              IconsEnum.energy.path,
              width: 16,
              height: 16,
            ),
          ),
      ],
    );
  }
}
