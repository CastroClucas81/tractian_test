import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_test/src/core/failures/failure.dart';
import 'package:tractian_test/src/features/assets/data/datasource/i_assets_datasource.dart';
import 'package:tractian_test/src/features/assets/data/repository/assets_repository_impl.dart';

import '../../utils/assets_utils.dart';

class MockAssetsDatasource extends Mock implements IAssetsDatasource {}

void main() {
  late MockAssetsDatasource datasource;
  late AssetsRepositoryImpl repository;

  group('[AssetsRepository]', () {
    setUp(() {
      datasource = MockAssetsDatasource();
      repository = AssetsRepositoryImpl(datasource);
    });

    group('[getLocations]', () {
      test(
          'Must return a list of locations if the datasource returns a response with data',
          () async {
        when(() => datasource.getLocations(any())).thenAnswer(
          (_) async => tLocationResponse,
        );

        final result = await repository.getLocations(tMockCompanyId);
        expect(result.isRight(), true);
      });

      test(
          'Must return an empty list if the datasource returns a response with no data',
          () async {
        when(() => datasource.getLocations(any())).thenAnswer(
          (_) async => eMockEmptyResponse,
        );

        final result = await repository.getLocations(tMockCompanyId);
        expect(result.isRight(), true);
      });

      test(
          'Should return a Failure if the datasource returns an incorrect response',
          () async {
        when(() => datasource.getLocations(any())).thenAnswer(
          (_) async => tBadResponse,
        );

        final result = await repository.getLocations(tMockCompanyId);
        expect(result.isLeft(), true);
      });

      test(
          'It should return a Failure if there is a problem in the return from datasource',
          () async {
        when(() => datasource.getLocations(any())).thenAnswer(
          (_) async => throw LocalFailure(),
        );

        final result = await repository.getLocations(tMockCompanyId);
        expect(result.isLeft(), true);
      });
    });

    group('[getAssets]', () {
      test(
          'Must return a list of assets if the datasource returns a response with data',
          () async {
        when(() => datasource.getAssets(any())).thenAnswer(
          (_) async => tAssetResponse,
        );

        final result = await repository.getAssets(tMockCompanyId);
        expect(result.isRight(), true);
      });

      test(
          'Must return an empty list if the datasource returns a response without data',
          () async {
        when(() => datasource.getAssets(any())).thenAnswer(
          (_) async => eMockEmptyResponse,
        );

        final result = await repository.getAssets(tMockCompanyId);
        expect(result.isRight(), true);
      });

      test(
          'Must return a Failure if the datasource returns a response incorrect',
          () async {
        when(() => datasource.getAssets(any())).thenAnswer(
          (_) async => tBadResponse,
        );

        final result = await repository.getAssets(tMockCompanyId);
        expect(result.isLeft(), true);
      });

      test(
          'It should return a Failure if there is a problem in the return from datasource',
          () async {
        when(() => datasource.getAssets(any())).thenAnswer(
          (_) async => throw LocalFailure(),
        );

        final result = await repository.getAssets(tMockCompanyId);
        expect(result.isLeft(), true);
      });
    });
  });
}
