import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian_test/generated/l10n.dart';
import 'package:tractian_test/src/features/assets/domain/entities/params/filter_params.dart';
import 'package:tractian_test/src/features/assets/presentation/cubit/assets_cubit.dart';
import 'package:tractian_test/src/features/assets/presentation/widgets/assets_skeleton_widget.dart';
import 'package:tractian_test/src/features/assets/presentation/widgets/asset_filters_widget.dart';
import 'package:tractian_test/src/features/assets/presentation/widgets/asset_tree_widget.dart';
import 'package:tractian_test/src/core/colors/app_colors_enum.dart';
import 'package:tractian_test/src/core/widgets/custom_bottom_sheet.dart';
import 'package:tractian_test/src/core/widgets/empty_widget.dart';
import 'package:tractian_test/src/core/widgets/generic_error_widget.dart';

class AssetsPage extends StatefulWidget {
  final String companyId;

  const AssetsPage({
    required this.companyId,
    super.key,
  });

  @override
  State<AssetsPage> createState() => _AssetsPageState();
}

class _AssetsPageState extends State<AssetsPage> {
  late final AssetsCubit cubit;

  @override
  void initState() {
    cubit = context.read<AssetsCubit>()..start(widget.companyId);

    super.initState();
  }

  void showFilters(FilterParams currentFilter) {
    CustomBottomSheet.show(
      context,
      title: S.of(context).filters,
      height: 250,
      child: AssetFiltersWidget(
        filtrar: cubit.onSearch,
        currentFilter: currentFilter,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColorsEnum.darkBlue.color,
        leading: IconButton(
          onPressed: Navigator.of(context).pop,
          icon: Icon(
            Icons.chevron_left,
            color: AppColorsEnum.white.color,
            size: 32,
          ),
        ),
        title: Text(
          S.of(context).assets,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: AppColorsEnum.white.color,
          ),
        ),
        actions: [
          BlocBuilder<AssetsCubit, AssetsState>(
            builder: (context, state) => state is! AssetsSuccess
                ? const SizedBox()
                : IconButton(
                    onPressed: () {
                      showFilters(state.filter);
                    },
                    icon: const Icon(Icons.search),
                  ),
          ),
        ],
      ),
      body: BlocBuilder<AssetsCubit, AssetsState>(
        builder: (context, state) => switch (state) {
          AssetsLoading() => const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: AssetsSkeletonWidget(),
            ),
          AssetsError() => GenericErrorWidget(
              description: S.of(context).anErrorOccurredWhenListAssets,
            ),
          AssetsEmpty() => EmptyWidget(
              title: S.of(context).noResults,
            ),
          AssetsSuccess() => state.filteredItens.isEmpty
              ? EmptyWidget(title: S.of(context).noResults)
              : AssetTreeWidget(itens: state.filteredItens, isFirstNivel: true)
        },
      ),
    );
  }
}
