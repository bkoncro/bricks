import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_connect.dart';

class BaseApi extends GetConnect {
  final Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json"
  };

  @override
  void onInit() {
    httpClient.baseUrl = '';
    httpClient.maxAuthRetries = 2;
    httpClient.maxRedirects = 2;
  }

  @override
  Future<Response<T>> get<T>(
    String url, {
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    T Function(dynamic)? decoder,
    dynamic Function(double)? uploadProgress,
  }) async {
    log('GET: $url, QUERY: $query');
    await header();
    try {
      Response<T> response = await httpClient
          .get<T>(
            url,
            headers: headers,
            contentType: contentType,
            decoder: decoder,
            query: query,
          )
          .timeout(
            const Duration(seconds: 15),
          );
      handleError(response);
      return response;
    } on TimeoutException catch (_) {
      // log('GET: $url, TIMEOUT');
      // Get.snackbar('Timeout: 15 seconds, try again later');
      return Response<T>();
    }
  }

  @override
  Future<Response<T>> post<T>(
    String? url,
    dynamic body, {
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Decoder<T>? decoder,
    Progress? uploadProgress,
  }) async {
    log('POST: $url');
    await header();
    try {
      Response<T> response = await httpClient
          .post<T>(
            url,
            body: body,
            headers: headers,
            contentType: contentType,
            query: query,
            decoder: decoder,
            uploadProgress: uploadProgress,
          )
          .timeout(
            const Duration(minutes: 1),
          );
      handleError(response);
      return response;
    } on TimeoutException catch (_) {
      log('POST: $url, TIMEOUT');
      // Get.snackbar('Timeout: 1 minute, try again later');
      return Response<T>();
    }
  }

  void handleError(Response response) {
    String? message;

    if (response.status.connectionError) {
      message = 'Koneksi anda terputus. Silahkan coba beberapa saat lagi.';
    } else if (response.status.isForbidden) {
      message = 'Terjadi sebuah kesalahan.';
    } else if (response.status.isNotFound) {
      message = 'Data Tidak ditemukan.';
    } else if (response.status.isServerError) {
      message = 'Terjadi sebuah kesalahan server.';
    } else if (response.status.isUnauthorized) {
      message = 'Sesi anda telah habis.';
    } else {
      if (response.body is Map &&
          ['fail', false].contains(response.body?['status'])) {
        log('error body: ${response.body}');
        if (response.body?['error'] is Map) {
          response.body?['error']?.forEach((key, value) {
            message ??= value[0];
          });
        }
        if (message == null) {
          if (response.body?['message'] is String) {
            message = response.body?['message'];
          }
        }
      }
    }
    // Show error
    if (message != null) {
      //DO alert message
    }
  }

  Future header() async {
    httpClient.addRequestModifier((Request request) async {
      // request.headers['Accept-Language'] = 'en_us';
      return request;
    });
  }
}
