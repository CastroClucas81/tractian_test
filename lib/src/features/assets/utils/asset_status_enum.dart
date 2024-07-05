import 'package:tractian_test/src/core/extensions/list_extension.dart';

enum AssetStatusEnum {
  alert('alert'),
  operating('operating');

  const AssetStatusEnum(this.type);

  final String type;

  static AssetStatusEnum? fromType(String text) {
    return AssetStatusEnum.values.firstWhereOrNull((e) => e.type == text);
  }
}
