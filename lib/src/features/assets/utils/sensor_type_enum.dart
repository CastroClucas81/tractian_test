import 'package:tractian_test/src/core/extensions/list_extension.dart';

enum SensorTypeEnum {
  energy('energy'),
  vibration('vibration');

  const SensorTypeEnum(this.type);

  final String type;

  static SensorTypeEnum? fromType(String text) {
    return SensorTypeEnum.values.firstWhereOrNull((e) => e.type == text);
  }
}
