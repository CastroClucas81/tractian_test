import 'package:dartz/dartz.dart';
import 'package:tractian_test/src/core/failures/failure.dart';
import 'package:tractian_test/src/features/companies/data/datasource/i_company_datasource.dart';
import 'package:tractian_test/src/features/companies/data/models/company_model.dart';
import 'package:tractian_test/src/features/companies/domain/entities/company_entity.dart';
import 'package:tractian_test/src/features/companies/domain/repository/i_company_repository.dart';

class CompanyRepositoryImpl implements ICompanyRepository {
  final ICompanyDatasource _datasource;

  CompanyRepositoryImpl(ICompanyDatasource datasource)
      : _datasource = datasource;

  @override
  Future<Either<Failure, List<CompanyEntity>>> getCompanies() async {
    try {
      final response = await _datasource.getCompanies();

      final companies =
          response.map((company) => CompanyModel.fromMap(company)).toList();

      return Right(companies);
    } on Failure catch (failure) {
      return Left(failure);
    } catch (_) {
      return Left(LocalFailure());
    }
  }
}
