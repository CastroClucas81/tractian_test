import 'package:flutter_test/flutter_test.dart';
import 'package:tractian_test/src/features/assets/data/models/location_model.dart';
import 'package:tractian_test/src/features/assets/domain/entities/location_entity.dart';

void main() {
  group('[LocationModel]', () {
    const tMockLocationModel = LocationModel(
      id: 'id',
      name: 'name',
      itens: [],
      parentId: 'parentId',
    );
    final tMockLocationModelMap = {
      'id': 'id',
      'name': 'name',
      'itens': [],
    };

    test('Must return an instance of LocationEntity', () {
      expect(tMockLocationModel, isA<LocationEntity>());
    });

    test('Must return a valid model (Map)', () {
      final result = LocationModel.fromMap(tMockLocationModelMap);

      expect(result, isA<LocationModel>());
    });
  });
}
