import 'package:flutter/material.dart';
import 'package:tractian_test/generated/l10n.dart';
import 'package:tractian_test/src/core/assets/icons_enum.dart';
import 'package:tractian_test/src/features/assets/domain/entities/params/filter_params.dart';
import 'package:tractian_test/src/features/assets/presentation/widgets/asset_text_form_widget.dart';
import 'package:tractian_test/src/core/utils/debouncer.dart';
import 'package:tractian_test/src/core/colors/app_colors_enum.dart';
import 'package:tractian_test/src/features/assets/presentation/widgets/asset_chip_filter_widget.dart';

class AssetFiltersWidget extends StatefulWidget {
  final FilterParams currentFilter;
  final void Function(FilterParams) filtrar;

  const AssetFiltersWidget({
    required this.currentFilter,
    required this.filtrar,
    super.key,
  });

  @override
  State<AssetFiltersWidget> createState() => _AssetFiltersWidgetState();
}

class _AssetFiltersWidgetState extends State<AssetFiltersWidget> {
  final focusNode = FocusNode();
  final searchController = TextEditingController();
  final debouncer = Debouncer(milliseconds: 300);

  late final ValueNotifier<FilterParams> filterNotifier;

  @override
  void initState() {
    searchController.text = widget.currentFilter.name;
    filterNotifier = ValueNotifier<FilterParams>(widget.currentFilter);
    super.initState();
  }

  void onClear() {
    filterNotifier.value = const FilterParams(name: '');
    searchController.clear();
  }

  void onSearch(FilterParams filter) {
    widget.filtrar(filter);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        child: ValueListenableBuilder(
            valueListenable: filterNotifier,
            builder: (context, filter, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AssetTextFormWidget(
                    focusNode: focusNode,
                    controller: searchController,
                    onTapOutside: (_) => focusNode.unfocus(),
                    hintText: S.of(context).searchActiveOrLocal,
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColorsEnum.gray.color,
                    ),
                    suffixIcon: filter.name.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              searchController.clear();
                              filterNotifier.value = filter.copyWith(name: '');
                            },
                            icon: const Icon(Icons.clear),
                          )
                        : null,
                    onChanged: (value) {
                      debouncer.run(() {
                        filterNotifier.value = filter.copyWith(name: value);
                      });
                    },
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    children: [
                      AssetChipFilterWidget(
                        isSelected: filter.isEnergySensor,
                        icone: IconsEnum.bolt,
                        title: S.of(context).energySensor,
                        onTap: () {
                          filterNotifier.value = filter.copyWith(
                            isEnergySensor: !filter.isEnergySensor,
                          );
                        },
                      ),
                      const SizedBox(width: 8),
                      AssetChipFilterWidget(
                        isSelected: filter.isCritic,
                        icone: IconsEnum.exclamationCircle,
                        title: S.of(context).critic,
                        onTap: () {
                          filterNotifier.value = filter.copyWith(
                            isCritic: !filter.isCritic,
                          );
                        },
                      )
                    ],
                  ),
                  const SizedBox(width: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton.icon(
                          onPressed: onClear,
                          icon: const Icon(Icons.clear),
                          label: Text(S.of(context).clear),
                          style: TextButton.styleFrom(
                            foregroundColor: AppColorsEnum.darkBlue.color,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () => onSearch(filter),
                          icon: const Icon(Icons.search),
                          label: Text(S.of(context).search),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColorsEnum.darkBlue.color,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              );
            }),
      ),
    );
  }

  @override
  void dispose() {
    filterNotifier.dispose();
    searchController.dispose();
    focusNode.dispose();
    debouncer.dispose();
    super.dispose();
  }
}
