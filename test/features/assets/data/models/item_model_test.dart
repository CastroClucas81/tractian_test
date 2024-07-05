import 'package:flutter_test/flutter_test.dart';
import 'package:tractian_test/src/features/assets/data/models/item_model.dart';
import 'package:tractian_test/src/features/assets/domain/entities/item_entity.dart';

void main() {
  group('[ItemModel]', () {
    final tMockItemModel = ItemModel(
      id: 'id',
      name: 'name',
      itens: [],
      parentId: 'parentId',
    );
    final tMockItemModelMap = {
      'id': 'id',
      'name': 'name',
      'itens': [],
    };

    test('Must return an instance of ItemEntity', () {
      expect(tMockItemModel, isA<ItemEntity>());
    });

    test('Must return a valid model (Map)', () {
      final result = ItemModel.fromMap(tMockItemModelMap);

      expect(result, isA<ItemModel>());
    });
  });
}
