import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_test/src/core/failures/failure.dart';
import 'package:tractian_test/src/features/companies/domain/repository/i_company_repository.dart';
import 'package:tractian_test/src/features/companies/domain/usecases/get_companies_usecase.dart';

import '../../utils/companies_mock.dart';

class MockCompanyRepository extends Mock implements ICompanyRepository {}

void main() {
  late MockCompanyRepository repository;
  late GetCompaniesUsecase usecase;

  group(['GetCompaniesUsecase'], () {
    setUp(() {
      repository = MockCompanyRepository();
      usecase = GetCompaniesUsecase(repository);
    });

    test('Should return a list of companies', () async {
      when(() => repository.getCompanies()).thenAnswer(
        (_) async => Right(tMockCompanyList),
      );

      final result = await usecase();

      expect(result, Right(tMockCompanyList));
    });

    test('It must return a LocalFailure if an error occurs', () async {
      when(() => repository.getCompanies()).thenAnswer(
        (_) async => Left(LocalFailure()),
      );

      final result = await usecase();

      expect(result, Left(LocalFailure()));
    });
  });
}
