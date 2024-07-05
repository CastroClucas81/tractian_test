import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_test/src/core/failures/failure.dart';
import 'package:tractian_test/src/features/assets/domain/entities/params/filter_params.dart';
import 'package:tractian_test/src/features/assets/domain/usecases/get_assets_usecase.dart';
import 'package:tractian_test/src/features/assets/domain/usecases/get_locations_usecase.dart';
import 'package:tractian_test/src/features/assets/presentation/cubit/assets_cubit.dart';

import '../../utils/assets_utils.dart';

class MockObterAssetsUsecase extends Mock implements GetAssetsUsecase {}

class MockObterLocationsUsecase extends Mock implements GetLocationsUsecase {}

void main() {
  late GetAssetsUsecase obterAssetsUsecase;
  late GetLocationsUsecase obterLocationsUsecase;
  late AssetsCubit cubit;

  group('[AssetsCubit]', () {
    setUp(() {
      obterAssetsUsecase = MockObterAssetsUsecase();
      obterLocationsUsecase = MockObterLocationsUsecase();
      cubit = AssetsCubit(
        obterAssetsUsecase: obterAssetsUsecase,
        obterLocationsUsecase: obterLocationsUsecase,
      );
    });

    tearDown(() {
      cubit.close();
    });

    void onStartSuccess() {
      when(() => obterAssetsUsecase(any())).thenAnswer(
        (_) async => Right(tAssetList),
      );
      when(() => obterLocationsUsecase(any())).thenAnswer(
        (_) async => Right(tLocationList),
      );
    }

    test('Must emit [AssetsLoading] as initial state', () {
      expect(cubit.state, AssetsLoading());
    });

    group('[start]', () {
      blocTest<AssetsCubit, AssetsState>(
        'Should emit [AssetsSuccess] when items are obtained',
        build: () {
          onStartSuccess();

          return cubit;
        },
        act: (cubit) async {
          await cubit.start(tMockCompanyId);
        },
        expect: () => [
          isA<AssetsSuccess>(),
        ],
      );

      blocTest<AssetsCubit, AssetsState>(
        'Must issue [AssetsError] when error is returned when obtaining assets',
        build: () {
          when(() => obterAssetsUsecase(any())).thenAnswer(
            (_) async => Left(LocalFailure()),
          );
          when(() => obterLocationsUsecase(any())).thenAnswer(
            (_) async => Right(tLocationList),
          );
          return cubit;
        },
        act: (cubit) async {
          await cubit.start(tMockCompanyId);
        },
        expect: () => [
          isA<AssetsError>(),
        ],
      );

      blocTest<AssetsCubit, AssetsState>(
        'It should issue [AssetsError] when it returns an error when obtaining the locations',
        build: () {
          when(() => obterAssetsUsecase(any())).thenAnswer(
            (_) async => Right(tAssetList),
          );
          when(() => obterLocationsUsecase(any())).thenAnswer(
            (_) async => Left(LocalFailure()),
          );
          return cubit;
        },
        act: (cubit) async {
          await cubit.start(tMockCompanyId);
        },
        expect: () => [
          isA<AssetsError>(),
        ],
      );

      blocTest<AssetsCubit, AssetsState>(
        'Should issue [AssetsEmpty] when there are no items',
        build: () {
          when(() => obterAssetsUsecase(any())).thenAnswer(
            (_) async => const Right([]),
          );
          when(() => obterLocationsUsecase(any())).thenAnswer(
            (_) async => const Right([]),
          );
          return cubit;
        },
        act: (cubit) async {
          await cubit.start(tMockCompanyId);
        },
        expect: () => [
          isA<AssetsEmpty>(),
        ],
      );
    });

    group('[onSearch]', () {
      blocTest<AssetsCubit, AssetsState>(
        'It should issue [AssetsSuccess, AssetsSuccess] if there is an item filter',
        build: () {
          onStartSuccess();

          return cubit;
        },
        act: (cubit) async {
          await cubit.start(tMockCompanyId);

          cubit.onSearch(const FilterParams(name: 'name', isCritic: true));
        },
        expect: () => [
          isA<AssetsSuccess>(),
          isA<AssetsSuccess>(),
        ],
      );

      blocTest<AssetsCubit, AssetsState>(
        'It should issue [AssetsSuccess] if there is no item filter',
        build: () {
          onStartSuccess();

          return cubit;
        },
        act: (cubit) async {
          await cubit.start(tMockCompanyId);

          cubit.onSearch(const FilterParams(name: ''));
        },
        expect: () => [
          isA<AssetsSuccess>(),
        ],
      );
    });
  });
}
