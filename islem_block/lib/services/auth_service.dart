import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {//'http://localhost:8080'; 
  static const String apiUrl = 'http://10.0.2.2:8080'; // 'http://10.0.2.2:8080' Emülatörde localhost yerine 10.0.2.2 kullan
  static String? token;  // Token'ı burada tutacağız

  // Giriş yapma işlemi
  static Future<bool> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$apiUrl/login/auth'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username, 'password': password}),
      );

      if (response.statusCode == 200) {
        // Giriş başarılı, token'ı al ve sakla
        var data = jsonDecode(response.body);
        token = data['token'];  // Eğer response body içinde token varsa
        print('Login successful, token: $token');
        return true;
      } else {
        // Hata durumunda durumu kontrol et
        print('Login failed with status: ${response.statusCode}, body: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Login error: $e');
      return false;
    }
  }

  // Kayıt olma işlemi
  static Future<bool> register(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$apiUrl/login/save'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username, 'password': password}),
      );

      if (response.statusCode == 200) {
        // Kayıt başarılı
        print('Registration successful');
        return true;
      } else {
        // Hata durumunda durumu kontrol et
        print('Registration failed with status: ${response.statusCode}, body: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Registration error: $e');
      return false;
    }
  }

  // Token'ı almak için bir yardımcı fonksiyon
  static String? getToken() {
    return token;
  }

  // Token'ı temizlemek için bir yardımcı fonksiyon
  static void clearToken() {
    token = null;
    print('Token cleared');
  }
}
