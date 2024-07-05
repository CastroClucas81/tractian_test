abstract class IAssetsDatasource {
  Future<List<dynamic>> getAssets(String companyId);
  Future<List<dynamic>> getLocations(String companyId);
}
