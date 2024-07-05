import 'package:dartz/dartz.dart';
import 'package:tractian_test/src/core/failures/failure.dart';
import 'package:tractian_test/src/features/assets/domain/entities/asset_entity.dart';
import 'package:tractian_test/src/features/assets/domain/repository/i_assets_repository.dart';

class GetAssetsUsecase {
  final IAssetsRepository _repository;

  GetAssetsUsecase(IAssetsRepository repository) : _repository = repository;

  Future<Either<Failure, List<AssetEntity>>> call(String companyId) =>
      _repository.getAssets(companyId);
}
