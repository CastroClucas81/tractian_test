import 'package:dartz/dartz.dart';
import 'package:tractian_test/src/core/failures/failure.dart';
import 'package:tractian_test/src/features/assets/domain/entities/asset_entity.dart';
import 'package:tractian_test/src/features/assets/domain/entities/location_entity.dart';

abstract class IAssetsRepository {
  Future<Either<Failure, List<AssetEntity>>> getAssets(String companyId);
  Future<Either<Failure, List<LocationEntity>>> getLocations(
    String companyId,
  );
}
