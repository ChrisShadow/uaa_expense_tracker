import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text('Información de los Editores', style: TextStyle(color: Colors.white)),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Integrantes:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text('1. Antonio duré', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Text('2. Cristhian Rolón', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Text('3. Francisco Florentín', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Text('4. José Trinidad', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Text('5. Lucas Cáceres', style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
