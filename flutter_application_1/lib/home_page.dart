import 'package:flutter/material.dart';

import 'api_service.dart';
import 'device_info.dart';

class HomePage extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Device ID App'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Enviar Device ID'),
          onPressed: () async {
            String? deviceId = await DeviceInfo.getDeviceId();
            print("-=--->");
            print(deviceId);
            await apiService.sendDeviceInfo(deviceId!);
          },
        ),
      ),
    );
  }
}
