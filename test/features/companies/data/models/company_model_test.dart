import 'package:flutter_test/flutter_test.dart';
import 'package:tractian_test/src/features/companies/data/models/company_model.dart';
import 'package:tractian_test/src/features/companies/domain/entities/company_entity.dart';

void main() {
  group('[CompanyModel]', () {
    const tMockCompanyModel = CompanyModel(
      id: 'id',
      name: 'name',
    );
    final tMockCompanyModelMap = {
      'id': 'id',
      'name': 'name',
    };

    test('Must return an instance of CompanyEntity', () {
      expect(tMockCompanyModel, isA<CompanyEntity>());
    });

    test('Must return a valid model (Map)', () {
      final result = CompanyModel.fromMap(tMockCompanyModelMap);

      expect(result, isA<CompanyModel>());
    });
  });
}
