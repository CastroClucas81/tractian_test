import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_test/src/core/failures/failure.dart';
import 'package:tractian_test/src/features/assets/domain/repository/i_assets_repository.dart';
import 'package:tractian_test/src/features/assets/domain/usecases/get_assets_usecase.dart';

import '../../utils/assets_utils.dart';

class MockAssetsRepository extends Mock implements IAssetsRepository {}

void main() {
  late MockAssetsRepository repository;
  late GetAssetsUsecase usecase;

  group('[GetAssetsUsecase]', () {
    setUp(() {
      repository = MockAssetsRepository();
      usecase = GetAssetsUsecase(repository);
    });

    test('Should return a list of assets', () async {
      when(() => repository.getAssets(any())).thenAnswer(
        (_) async => Right(tAssetList),
      );

      final result = await usecase(tMockCompanyId);
      expect(result, Right(tAssetList));
    });

    test('It must return a LocalFailure if an error occurs when obtaining',
        () async {
      when(() => repository.getAssets(any())).thenAnswer(
        (_) async => Left(LocalFailure()),
      );

      final result = await usecase(tMockCompanyId);
      expect(result, Left(LocalFailure()));
    });
  });
}
