import 'package:tractian_test/src/features/assets/domain/entities/item_entity.dart';

class LocationEntity extends ItemEntity {
  const LocationEntity({
    required super.id,
    required super.name,
    required super.itens,
    super.parentId,
  });
}
