import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_test/src/features/companies/domain/usecases/get_companies_usecase.dart';
import 'package:tractian_test/src/features/companies/presentation/cubit/companies_cubit.dart';

import '../../utils/companies_mock.dart';

class MockObterCompaniesUsecase extends Mock implements GetCompaniesUsecase {}

void main() {
  group('[Companies]', () {
    late MockObterCompaniesUsecase usecase;
    late CompaniesCubit cubit;

    setUp(() {
      usecase = MockObterCompaniesUsecase();
      cubit = CompaniesCubit(usecase);
    });

    tearDown(() {
      cubit.close();
    });

    test('Must emit [CompaniesLoading] as initial state', () {
      expect(cubit.state, CompaniesLoading());
    });

    blocTest<CompaniesCubit, CompaniesState>(
      'Must issue [CompaniesSuccess] when companies are obtained',
      build: () {
        when(() => usecase()).thenAnswer((_) async => Right(tMockCompanyList));
        return cubit;
      },
      act: (cubit) async {
        await cubit.start();
      },
      expect: () => [
        isA<CompaniesSuccess>(),
      ],
      verify: (cubit) {
        final state = cubit.state;

        if (state is CompaniesSuccess) {
          expect(state.companies, isNotEmpty);
          expect(state.companies.first.name, equals('Jaguar Unit'));
        }
      },
    );

    blocTest<CompaniesCubit, CompaniesState>(
      'It should issue [CompaniesError] when returning error',
      build: () {
        when(() => usecase()).thenAnswer((_) async => Left(tLocalFailure));
        return cubit;
      },
      act: (cubit) async {
        await cubit.start();
      },
      expect: () => <dynamic>[
        isA<CompaniesError>(),
      ],
    );
  });
}
