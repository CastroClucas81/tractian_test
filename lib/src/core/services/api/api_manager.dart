import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tractian_test/src/core/failures/failure.dart';
import 'package:tractian_test/src/core/utils/request_content_type_enum.dart';

import 'i_api_manager.dart';

class ApiManager implements IApiManager {
  CancelToken cancelToken = CancelToken();
  late final Dio _dio;

  ApiManager() {
    _dio = Dio(
      BaseOptions(
        baseUrl: const String.fromEnvironment('baseUrl'),
        headers: {
          'content-type': '${RequestContentTypeEnum.json.text};charset=utf-8',
          'ngrok-skip-browser-warning': 'true',
        },
      ),
    );
    if (kDebugMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            error: true,
            compact: true,
            maxWidth: 90),
      );
    }
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 70);
  }

  @override
  Future delete(
    String url,
    Map<String, dynamic> requestParams, {
    body,
    RequestContentTypeEnum contentType = RequestContentTypeEnum.json,
  }) async {
    try {
      final response = await _dio.delete(
        url,
        queryParameters: requestParams,
        data: body,
        cancelToken: cancelToken,
        options: Options(
          contentType: RequestContentTypeEnum.json.text,
        ),
      );

      return response.data;
    } catch (error) {
      throw ServerFailure();
    }
  }

  @override
  Future get(
    String url, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? additionalHeader,
    RequestContentTypeEnum? contentType = RequestContentTypeEnum.json,
    ResponseType? responseType = ResponseType.json,
  }) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParams,
        cancelToken: cancelToken,
        options: Options(
          headers: additionalHeader,
          responseType: responseType,
        ),
      );

      return response.data;
    } catch (error) {
      throw ServerFailure();
    }
  }

  @override
  Future patch(
    String url,
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await _dio.patch(
        url,
        data: body,
        cancelToken: cancelToken,
        options: Options(
          contentType: RequestContentTypeEnum.json.text,
        ),
      );

      return response.data;
    } catch (error) {
      throw ServerFailure();
    }
  }

  @override
  Future post(
    String url,
    data, {
    Map<String, dynamic>? requestParams,
    Map<String, dynamic>? additionalHeader,
    RequestContentTypeEnum contentType = RequestContentTypeEnum.json,
  }) async {
    try {
      final response = await _dio.post(
        url,
        data: data,
        options: Options(
          contentType: contentType.text,
          headers: additionalHeader,
        ),
        queryParameters: requestParams,
      );

      return response.data;
    } catch (error) {
      throw ServerFailure();
    }
  }

  @override
  Future put(
    String url,
    body, {
    Map<String, dynamic>? requestParams,
    RequestContentTypeEnum contentType = RequestContentTypeEnum.json,
    Map<String, dynamic>? additionalHeader,
  }) async {
    try {
      final response = await _dio.put(
        url,
        data: body,
        cancelToken: cancelToken,
        options: Options(
          contentType: contentType.text,
          headers: additionalHeader,
        ),
        queryParameters: requestParams,
      );

      return response.data;
    } catch (error) {
      throw ServerFailure();
    }
  }
}
