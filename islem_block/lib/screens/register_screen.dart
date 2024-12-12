import 'package:flutter/material.dart';
import '../services/auth_service.dart';  // AuthService'yi import edin

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Kayıt işlemi
  void _register() async {
    String username = usernameController.text;
    String password = passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      // Kullanıcı adı veya şifre boş olamaz
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Kullanıcı adı ve şifre boş olamaz!'),
      ));
      return;
    }

    // Kayıt işlemini başlat
    bool isSuccess = await AuthService.register(username, password);

    if (isSuccess) {
      // Kayıt başarılı ise login ekranına yönlendirme yapabilirsiniz
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Kayıt başarılı!'),
      ));
      // Kayıt başarılı olduktan sonra login ekranına yönlendirme (isteğe bağlı)
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Kayıt başarısız!'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kayıt Ol')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Kullanıcı Adı'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Şifre'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _register, // Kayıt işlemi tetikleniyor
              child: Text('Kaydol'),
            ),
          ],
        ),
      ),
    );
  }
}
