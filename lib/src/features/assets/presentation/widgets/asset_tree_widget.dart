import 'package:flutter/material.dart';
import 'package:tractian_test/generated/l10n.dart';
import 'package:tractian_test/src/core/assets/icons_enum.dart';
import 'package:tractian_test/src/core/colors/app_colors_enum.dart';
import 'package:tractian_test/src/features/assets/domain/entities/asset_entity.dart';
import 'package:tractian_test/src/features/assets/domain/entities/item_entity.dart';
import 'package:tractian_test/src/features/assets/domain/entities/location_entity.dart';
import 'package:tractian_test/src/features/assets/presentation/widgets/asset_icon_widget.dart';

class AssetTreeWidget extends StatelessWidget {
  final List<ItemEntity> itens;
  final bool isFirstNivel;

  const AssetTreeWidget({
    required this.itens,
    this.isFirstNivel = false,
    super.key,
  });

  String? handleIcon(ItemEntity item) => switch (item) {
        LocationEntity() => IconsEnum.location.path,
        AssetEntity() =>
          item.isComponent ? IconsEnum.component.path : IconsEnum.asset.path,
        _ => null,
      };

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: isFirstNivel
          ? const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 16,
            )
          : const EdgeInsets.only(left: 10),
      physics: isFirstNivel
          ? const AlwaysScrollableScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: itens.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final item = itens[index];
        final subitens = item.itens;
        final icon = handleIcon(item);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTileTheme(
              horizontalTitleGap: 10,
              minLeadingWidth: 10,
              minVerticalPadding: 10,
              child: ExpansionTile(
                enabled: item.itens.isNotEmpty,
                dense: true,
                visualDensity: VisualDensity.compact,
                tilePadding: EdgeInsets.zero,
                shape: const Border(),
                title: Row(
                  children: [
                    if (icon != null) ...[
                      Image.asset(icon, height: 20),
                      const SizedBox(width: 6)
                    ],
                    SizedBox(
                      height: 20,
                      child: CircleAvatar(
                        backgroundColor: item.itens.isNotEmpty
                            ? AppColorsEnum.lightBlue.color
                            : AppColorsEnum.gray.color.withOpacity(0.5),
                        child: Text(
                          '${item.itens.length}',
                          style: TextStyle(
                              fontSize: 12, color: AppColorsEnum.white.color),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        item.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    if (item is AssetEntity) AssetIconWidget(item: item)
                  ],
                ),
                leading: !isFirstNivel
                    ? const Icon(Icons.subdirectory_arrow_right_rounded)
                    : null,
                children: [
                  if (subitens.isNotEmpty)
                    AssetTreeWidget(itens: subitens)
                  else
                    Text(S.of(context).noResults),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
