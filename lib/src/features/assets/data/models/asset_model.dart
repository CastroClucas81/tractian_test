import 'package:tractian_test/src/features/assets/domain/entities/asset_entity.dart';
import 'package:tractian_test/src/features/assets/utils/asset_status_enum.dart';
import 'package:tractian_test/src/features/assets/utils/sensor_type_enum.dart';

class AssetModel extends AssetEntity {
  const AssetModel({
    required super.id,
    required super.name,
    required super.itens,
    super.parentId,
    super.locationId,
    super.sensorType,
    super.status,
  });

  factory AssetModel.fromMap(Map<String, dynamic> map) {
    return AssetModel(
      id: map['id'],
      name: map['name'],
      locationId: map['locationId'],
      parentId: map['parentId'],
      sensorType: map['sensorType'] != null
          ? SensorTypeEnum.fromType(map['sensorType'])
          : null,
      status: map['status'] != null
          ? AssetStatusEnum.fromType(map['status'])
          : null,
      itens: [],
    );
  }
}
