import 'package:http/http.dart' as http;

class ApiService {
  static const String endpoint = 'https://www.google.com.sg/';

  Future<void> sendDeviceInfo(String deviceId) async {
    // Envia o deviceId para o endpoint externo
    try {
      await http.post(Uri.parse('$endpoint/$deviceId'));
      print('Device ID enviado com sucesso! - $deviceId');
    } catch (e) {
      print('Falha ao enviar o Device ID: $e - $deviceId');
    }
  }
}
