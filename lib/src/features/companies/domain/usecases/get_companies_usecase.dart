import 'package:dartz/dartz.dart';
import 'package:tractian_test/src/core/failures/failure.dart';
import 'package:tractian_test/src/features/companies/domain/entities/company_entity.dart';
import 'package:tractian_test/src/features/companies/domain/repository/i_company_repository.dart';

class GetCompaniesUsecase {
  final ICompanyRepository _repository;

  GetCompaniesUsecase(ICompanyRepository repository) : _repository = repository;

  Future<Either<Failure, List<CompanyEntity>>> call() =>
      _repository.getCompanies();
}
