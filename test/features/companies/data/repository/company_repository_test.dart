import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_test/src/core/failures/failure.dart';
import 'package:tractian_test/src/features/companies/data/datasource/i_company_datasource.dart';
import 'package:tractian_test/src/features/companies/data/repository/company_repository_impl.dart';

import '../../utils/companies_mock.dart';

class MockCompaniesDatasource extends Mock implements ICompanyDatasource {}

void main() {
  late MockCompaniesDatasource datasource;
  late CompanyRepositoryImpl repository;

  setUp(() {
    datasource = MockCompaniesDatasource();
    repository = CompanyRepositoryImpl(datasource);
  });

  group('[CompanyRepository]', () {
    group('[getCompanies]', () {
      test('Must return a list of companies', () async {
        when(() => datasource.getCompanies()).thenAnswer(
          (_) async => tMockCompaniesData,
        );

        final result = await repository.getCompanies();
        expect(result.isRight(), true);
      });

      test(
          'It must return a Failure when there is a problem returning the datasource',
          () async {
        when(() => datasource.getCompanies()).thenAnswer(
          (_) async => throw LocalFailure(),
        );

        final result = await repository.getCompanies();
        expect(result.isLeft(), true);
      });

      test(
          'Must return an empty list when the datasource returns a response with no data',
          () async {
        when(() => datasource.getCompanies()).thenAnswer(
          (_) async => [],
        );

        final result = await repository.getCompanies();
        expect(result.isRight(), true);
      });

      test(
          'Must return a Failure when the datasource returns an incorrect response',
          () async {
        when(() => datasource.getCompanies()).thenAnswer(
          (_) async => tMockBadResponse,
        );

        final result = await repository.getCompanies();
        expect(result.isLeft(), true);
      });
    });
  });
}
