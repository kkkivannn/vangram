import 'dart:convert';
import 'dart:developer';

import 'package:vangram/core/constants/config.dart';
import 'package:web_socket_channel/io.dart';

typedef SocketMessage = Map<String, dynamic>;

abstract final class Socket {
  Socket._();

  static late IOWebSocketChannel _channel;

  static IOWebSocketChannel get channel => _channel;

  static Future<void> connectWs() async {
    try {
      final String wss = Config.wssBaseUrl;
      log('Socket connecting....');
      _channel = IOWebSocketChannel.connect(
        Uri.parse(wss),
        pingInterval: const Duration(seconds: 1),
        connectTimeout: const Duration(seconds: 10),
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTU1OTc5MzIsImp0aSI6ImIwMTAxNDc3LTk2YTQtNGM2NS05MTZkLWYzNjI1OGVmODdhNSIsImlhdCI6MTcxNTU5NDkzMiwidXNlcl9pZCI6MX0.60Angn09Xrorwei6Y_1SyPkTwSWb5v5Rz-8E0YFWCGM',
        },
      );
      await _channel.ready;
      log("Socket connected!");
    } catch (_) {
      rethrow;
    }
  }

  static Future<void> addToChannel({required SocketMessage value}) async {
    _channel.sink.add(jsonEncode(value));
  }
}
