import 'package:dartz/dartz.dart';
import 'package:tractian_test/src/core/failures/failure.dart';
import 'package:tractian_test/src/features/assets/domain/entities/location_entity.dart';
import 'package:tractian_test/src/features/assets/domain/repository/i_assets_repository.dart';

class GetLocationsUsecase {
  final IAssetsRepository _repository;

  GetLocationsUsecase(IAssetsRepository repository) : _repository = repository;

  Future<Either<Failure, List<LocationEntity>>> call(String companyId) =>
      _repository.getLocations(companyId);
}
