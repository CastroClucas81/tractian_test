import 'package:flutter_test/flutter_test.dart';
import 'package:tractian_test/src/features/assets/data/models/asset_model.dart';
import 'package:tractian_test/src/features/assets/domain/entities/asset_entity.dart';

void main() {
  group('[AssetModel]', () {
    const tMockAssetModel = AssetModel(
      id: 'id',
      name: 'name',
      itens: [],
    );
    final tMockAssetModelMap = {
      'id': 'id',
      'name': 'name',
      'itens': [],
    };

    test('Must return an instance of AssetEntity', () {
      expect(tMockAssetModel, isA<AssetEntity>());
    });

    test('Must return a valid model (Map)', () {
      final result = AssetModel.fromMap(tMockAssetModelMap);

      expect(result, isA<AssetModel>());
    });
  });
}
