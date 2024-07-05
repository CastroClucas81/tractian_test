import 'package:dartz/dartz.dart';
import 'package:tractian_test/src/core/failures/failure.dart';
import 'package:tractian_test/src/features/companies/domain/entities/company_entity.dart';

abstract class ICompanyRepository {
  Future<Either<Failure, List<CompanyEntity>>> getCompanies();
}
