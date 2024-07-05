import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:tractian_test/src/core/failures/failure.dart';
import 'package:tractian_test/src/features/assets/data/datasource/i_assets_datasource.dart';
import 'package:tractian_test/src/features/assets/data/models/asset_model.dart';
import 'package:tractian_test/src/features/assets/data/models/location_model.dart';
import 'package:tractian_test/src/features/assets/domain/entities/asset_entity.dart';
import 'package:tractian_test/src/features/assets/domain/entities/location_entity.dart';
import 'package:tractian_test/src/features/assets/domain/repository/i_assets_repository.dart';

class AssetsRepositoryImpl implements IAssetsRepository {
  final IAssetsDatasource _datasource;

  AssetsRepositoryImpl(final IAssetsDatasource datasource)
      : _datasource = datasource;

  @override
  Future<Either<Failure, List<AssetEntity>>> getAssets(
    String companyId,
  ) async {
    try {
      final response = await _datasource.getAssets(companyId);

      final assets =
          response.map((asset) => AssetModel.fromMap(asset)).toList();

      return Right(assets);
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      debugPrint(e.toString());
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, List<LocationEntity>>> getLocations(
    String companyId,
  ) async {
    try {
      final response = await _datasource.getLocations(companyId);

      final locations =
          response.map((location) => LocationModel.fromMap(location)).toList();

      return Right(locations);
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      debugPrint(e.toString());
      return Left(LocalFailure());
    }
  }
}
