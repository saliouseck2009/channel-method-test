import 'package:flutter/services.dart';

class BatteryLevel {
  static const MethodChannel _channel = MethodChannel('com.example/battery');

  static Future<int?> getBatteryLevel() async {
    try {
      final int? batteryLevel = await _channel.invokeMethod('getBatteryLevel');
      return batteryLevel;
    } catch (e) {
      print("Failed to get battery level: $e");
      return null;
    }
  }
}