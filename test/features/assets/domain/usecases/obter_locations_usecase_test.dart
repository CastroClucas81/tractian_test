import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_test/src/core/failures/failure.dart';
import 'package:tractian_test/src/features/assets/domain/repository/i_assets_repository.dart';
import 'package:tractian_test/src/features/assets/domain/usecases/get_locations_usecase.dart';

import '../../utils/assets_utils.dart';

class MockAssetsRepository extends Mock implements IAssetsRepository {}

void main() {
  late MockAssetsRepository repository;
  late GetLocationsUsecase usecase;

  setUp(() {
    repository = MockAssetsRepository();
    usecase = GetLocationsUsecase(repository);
  });

  test('It should return a list of locations', () async {
    when(() => repository.getLocations(any())).thenAnswer(
      (_) async => Right(tLocationList),
    );

    final resultado = await usecase(tMockCompanyId);
    expect(resultado, Right(tLocationList));
  });

  test('It must return a LocalFailure if an error occurs when obtaining',
      () async {
    when(() => repository.getLocations(any())).thenAnswer(
      (_) async => Left(LocalFailure()),
    );

    final resultado = await usecase(tMockCompanyId);
    expect(resultado, Left(LocalFailure()));
  });
}
