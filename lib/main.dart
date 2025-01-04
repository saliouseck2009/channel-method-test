import 'package:flutter/material.dart';
import 'service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BatteryLevelPage(),
    );
  }
}

class BatteryLevelPage extends StatefulWidget {
  const BatteryLevelPage({super.key});

  @override
  _BatteryLevelPageState createState() => _BatteryLevelPageState();
}

class _BatteryLevelPageState extends State<BatteryLevelPage> {
  String _batteryLevel = "Unknown";

  Future<void> _getBatteryLevel() async {
    final batteryLevel = await BatteryLevel.getBatteryLevel();
    setState(() {
      _batteryLevel = batteryLevel != null
          ? "$batteryLevel%"
          : "Failed to get battery level";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Battery Level")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Battery Level: $_batteryLevel"),
            ElevatedButton(
              onPressed: _getBatteryLevel,
              child: const Text("Get Battery Level"),
            ),
          ],
        ),
      ),
    );
  }
}
