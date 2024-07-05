import 'package:flutter/material.dart';
import 'package:tractian_test/src/core/failures/failure.dart';
import 'package:tractian_test/src/core/services/api/i_api_manager.dart';
import 'package:tractian_test/src/features/assets/data/datasource/i_assets_datasource.dart';

class AssetsRemoteDatasource implements IAssetsDatasource {
  final IApiManager _apiManager;

  AssetsRemoteDatasource({required IApiManager apiManager})
      : _apiManager = apiManager;

  @override
  Future<List<dynamic>> getAssets(String companyId) async {
    try {
      return await _apiManager.get('companies/$companyId/assets');
    } catch (e) {
      debugPrint(e.toString());
      throw LocalFailure();
    }
  }

  @override
  Future<List<dynamic>> getLocations(String companyId) async {
    try {
      return await _apiManager.get('companies/$companyId/locations');
    } catch (e) {
      debugPrint(e.toString());
      throw LocalFailure();
    }
  }
}
