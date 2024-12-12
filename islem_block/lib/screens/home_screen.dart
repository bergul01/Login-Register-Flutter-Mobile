import 'package:flutter/material.dart';
import 'login_screen.dart'; // Login ekranınızı buraya import edin

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ana Sayfa'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              // Çıkış yapıldığında login ekranına yönlendirme
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Hoş geldiniz!'),
      ),
    );
  }
}