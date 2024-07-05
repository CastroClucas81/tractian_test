import 'package:tractian_test/src/features/assets/data/models/asset_model.dart';
import 'package:tractian_test/src/features/assets/data/models/location_model.dart';

const tMockCompanyId = '1';

List<dynamic> eMockEmptyResponse = [];

dynamic tBadResponse = {};

List<dynamic> tLocationResponse = [
  {
    'name': 'Corn Cooking Facility',
    'id': '6a9b4171b62cbf0062dd8a67',
    'parentId': null
  },
  {
    'name': 'Decantation Unit 1',
    'parentId': '6b21f6fa9e497d001e2d4fcf',
    'id': '6b245a175832e7001ecac62d'
  },
  {
    'name': 'Storage',
    'id': '6080fa1b2515c0001e62cf87',
    'parentId': null,
  },
  {
    'name': 'Distillery Unit 1',
    'id': '6a944484aac55c0062464050',
    'parentId': null
  },
  {
    'name': 'Evaporator',
    'id': '6a9b47f2cac55c0062464076',
    'parentId': null,
  }
];

List<dynamic> tAssetResponse = [
  {
    'name': 'CONVEYOR BELT ASSEMBLY',
    'id': '656a07bbf2d4a1001e2144c2',
    'locationId': '656a07b3f2d4a1001e2144bf',
    'parentId': null,
    'sensorType': null,
    'status': null
  },
  {
    'name': 'Fan - External',
    'id': '656734821f4664001f296973',
    'locationId': null,
    'parentId': null,
    'sensorType': 'energy',
    'status': 'operating'
  },
  {
    'name': 'Fan H12D',
    'id': '656734448eb037001e474a62',
    'locationId': '656733b1664c41001e91d9ed',
    'parentId': null,
    'sensorType': null,
    'status': null
  },
  {
    'name': 'MOTOR RT COAL AF01',
    'id': '656a07cdc50ec9001e84167b',
    'locationId': null,
    'parentId': '656a07c3f2d4a1001e2144c5',
    'sensorType': 'vibration',
    'status': 'operating'
  },
  {
    'name': 'MOTOR TC01 COAL UNLOADING AF02',
    'id': '656a07c3f2d4a1001e2144c5',
    'locationId': null,
    'parentId': '656a07bbf2d4a1001e2144c2',
    'sensorType': null,
    'status': null
  },
  {
    'name': 'Motor H12D- Stage 1',
    'id': '6567340c1f4664001f29622e',
    'locationId': null,
    'parentId': '656734968eb037001e474d5a',
    'sensorType': 'vibration',
    'status': 'alert'
  },
  {
    'name': 'Motor H12D-Stage 2',
    'id': '6567340c664c41001e91dceb',
    'locationId': null,
    'parentId': '656734968eb037001e474d5a',
    'sensorType': 'vibration',
    'status': 'alert'
  },
  {
    'name': 'Motor H12D-Stage 3',
    'id': '656733921f4664001f295e9b',
    'locationId': null,
    'parentId': '656734968eb037001e474d5a',
    'sensorType': 'vibration',
    'status': 'alert'
  },
  {
    'name': 'Motors H12D',
    'id': '656734968eb037001e474d5a',
    'locationId': '656733b1664c41001e91d9ed',
    'parentId': null,
    'sensorType': null,
    'status': null
  }
];

final tLocationList = tLocationResponse
    .map((location) => LocationModel.fromMap(location))
    .toList();

final tAssetList =
    tAssetResponse.map((asset) => AssetModel.fromMap(asset)).toList();
