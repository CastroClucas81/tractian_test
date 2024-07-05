import 'package:tractian_test/src/features/assets/domain/entities/item_entity.dart';
import 'package:tractian_test/src/features/assets/utils/asset_status_enum.dart';
import 'package:tractian_test/src/features/assets/utils/sensor_type_enum.dart';

class AssetEntity extends ItemEntity {
  final String? locationId;
  final SensorTypeEnum? sensorType;
  final AssetStatusEnum? status;

  const AssetEntity({
    required super.id,
    required super.name,
    required super.itens,
    super.parentId,
    this.locationId,
    this.sensorType,
    this.status,
  });

  bool get isComponent => sensorType != null;

  bool get isSingleComponent =>
      isComponent && parentId == null && locationId == null;

  bool get isEnergySensor => sensorType == SensorTypeEnum.energy;

  bool get isCritic => status == AssetStatusEnum.alert;
}