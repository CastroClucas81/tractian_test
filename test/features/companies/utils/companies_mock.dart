import 'package:tractian_test/src/core/failures/failure.dart';
import 'package:tractian_test/src/features/companies/domain/entities/company_entity.dart';

List<dynamic> tMockBadResponse = [
  {'id': 1},
];

List<dynamic> tMockCompaniesData = [
  {'id': '1', 'name': 'Jaguar Unit'},
  {'id': '2', 'name': 'Tobias Unit'},
  {'id': '3', 'name': 'Apex Unit'}
];

List<CompanyEntity> tMockCompanyList = const [
  CompanyEntity(id: '1', name: 'Jaguar Unit'),
  CompanyEntity(id: '2', name: 'Tobias Unit'),
  CompanyEntity(id: '3', name: 'Apex Unit'),
];

final tLocalFailure = LocalFailure();
