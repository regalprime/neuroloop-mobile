import 'package:flutter/services.dart';

class PdfNativeDataSource {
  static const MethodChannel _channel = MethodChannel("com.neuroloop.neuroloop.pdf");

  Future<String> extractText({required String path}) async {
    final String? result = await _channel.invokeMethod<String>(
      'extractText',
      <String, dynamic>{'path': path},
    );
    return result ?? '';
  }
}
