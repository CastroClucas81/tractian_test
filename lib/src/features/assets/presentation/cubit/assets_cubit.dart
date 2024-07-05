import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tractian_test/src/core/failures/failure.dart';
import 'package:tractian_test/src/features/assets/domain/entities/asset_entity.dart';
import 'package:tractian_test/src/features/assets/domain/entities/params/filter_params.dart';
import 'package:tractian_test/src/features/assets/domain/entities/item_entity.dart';
import 'package:tractian_test/src/features/assets/domain/entities/location_entity.dart';
import 'package:tractian_test/src/features/assets/domain/usecases/get_assets_usecase.dart';
import 'package:tractian_test/src/features/assets/domain/usecases/get_locations_usecase.dart';

part 'assets_state.dart';

class AssetsCubit extends Cubit<AssetsState> {
  final GetAssetsUsecase _obterAssetsUsecase;
  final GetLocationsUsecase _obterLocationsUsecase;

  AssetsCubit({
    required GetAssetsUsecase obterAssetsUsecase,
    required GetLocationsUsecase obterLocationsUsecase,
  })  : _obterAssetsUsecase = obterAssetsUsecase,
        _obterLocationsUsecase = obterLocationsUsecase,
        super(AssetsLoading());

  Future<void> start(String companyId) async {
    final results = await Future.wait([
      _obterAssetsUsecase(companyId),
      _obterLocationsUsecase(companyId),
    ]);

    final isError = results.any((e) => e.isLeft());

    if (isError) return emit(AssetsError());

    final assets = (results[0] as Either<Failure, List<AssetEntity>>)
        .getOrElse(() => <AssetEntity>[]);
    final locations = (results[1] as Either<Failure, List<LocationEntity>>)
        .getOrElse(() => <LocationEntity>[]);

    Map<String, LocationEntity> locationMap = {};
    Map<String, AssetEntity> assetMap = {};
    List<ItemEntity> totalItens = [];

    for (final location in locations) {
      locationMap[location.id] = location;
    }

    for (final asset in assets) {
      if (asset.isSingleComponent) {
        totalItens.add(asset);
      } else {
        assetMap[asset.id] = asset;
      }
    }

    for (final asset in assets) {
      if (asset.parentId != null && assetMap.containsKey(asset.parentId)) {
        assetMap[asset.parentId]!.itens.add(asset);
      }
    }

    assetMap.forEach((_, asset) {
      if (asset.locationId != null &&
          asset.parentId == null &&
          locationMap.containsKey(asset.locationId)) {
        locationMap[asset.locationId]!.itens.add(asset);
      }

      if (asset.locationId == null &&
          asset.parentId == null &&
          !asset.isComponent) {
        totalItens.add(asset);
      }
    });

    for (final location in locations) {
      if (location.parentId != null &&
          locationMap.containsKey(location.parentId)) {
        locationMap[location.parentId]!.itens.add(location);
      }
    }

    locationMap.forEach((_, location) {
      if (location.parentId == null) {
        totalItens.add(location);
      }
    });

    if (totalItens.isEmpty) return emit(AssetsEmpty());

    totalItens = totalItens.reversed.toList();
    emit(AssetsSuccess(
      itens: totalItens,
      filteredItens: totalItens,
      filter: const FilterParams(name: ''),
    ));
  }

  void onSearch(FilterParams filter) {
    final success = state as AssetsSuccess;
    final isFilterChanged =
        filter.isCritic || filter.isEnergySensor || filter.name.isNotEmpty;

    if (!isFilterChanged) {
      return emit(success.copyWith(
        filteredItens: success.itens,
        filter: filter,
      ));
    }

    final filteredItens = _filterItens(
      itens: success.itens,
      filtro: filter,
    );

    emit(success.copyWith(
      filteredItens: filteredItens,
      filter: filter,
    ));
  }

  List<ItemEntity> _filterItens({
    required List<ItemEntity> itens,
    required FilterParams filtro,
  }) {
    return itens.where((item) {
      final children = _filterItens(
        itens: item.itens,
        filtro: filtro,
      );

      bool isCritic = !filtro.isCritic;
      bool isEnergy = !filtro.isEnergySensor;
      bool isString = filtro.name.isEmpty ||
          item.name.toLowerCase().contains(
                filtro.name.toLowerCase(),
              );

      if (item is AssetEntity) {
        if (filtro.isCritic) isCritic = item.isCritic;

        if (filtro.isEnergySensor) isEnergy = item.isEnergySensor;
      }

      final hasFilter = isString && isCritic && isEnergy;

      return hasFilter || children.isNotEmpty;
    }).toList();
  }
}
