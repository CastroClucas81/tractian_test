import 'package:dio/dio.dart';
import 'package:tractian_test/src/core/utils/request_content_type_enum.dart';

abstract class IApiManager {
  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? additionalHeader,
    RequestContentTypeEnum? contentType = RequestContentTypeEnum.json,
    ResponseType? responseType = ResponseType.json,
  });

  Future<dynamic> post(
    String url,
    dynamic data, {
    Map<String, dynamic>? requestParams,
    Map<String, dynamic>? additionalHeader,
    RequestContentTypeEnum contentType = RequestContentTypeEnum.json,
  });

  Future<dynamic> put(
    String url,
    dynamic body, {
    Map<String, dynamic>? requestParams,
    RequestContentTypeEnum contentType = RequestContentTypeEnum.json,
    Map<String, dynamic>? additionalHeader,
  });

  Future<dynamic> patch(String url, Map<String, dynamic> body);

  Future<dynamic> delete(
    String url,
    Map<String, dynamic> requestParams, {
    dynamic body,
    RequestContentTypeEnum contentType = RequestContentTypeEnum.json,
  });
}
