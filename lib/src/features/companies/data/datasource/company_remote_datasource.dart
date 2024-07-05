import 'package:flutter/material.dart';
import 'package:tractian_test/src/core/failures/failure.dart';
import 'package:tractian_test/src/core/services/api/i_api_manager.dart';
import 'package:tractian_test/src/features/companies/data/datasource/i_company_datasource.dart';

class CompanyRemoteDatasource implements ICompanyDatasource {
  final IApiManager _apiManager;

  CompanyRemoteDatasource({required IApiManager apiManager})
      : _apiManager = apiManager;

  @override
  Future<List<dynamic>> getCompanies() async {
    try {
      return await _apiManager.get('/companies');
    } catch (e) {
      debugPrint(e.toString());
      throw LocalFailure();
    }
  }
}
