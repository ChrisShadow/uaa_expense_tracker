import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text('Acerca del proyecto:', style: TextStyle(color: Colors.white)),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100.0,
                child: Image(image: AssetImage('assets/icons/loguaa.jpg')),
              ),
              Text('Universidad Autónoma de Asunción - Facultad Ciencias y Tecnología', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              Text('Materia: Programación para Dispositivos Móviles Avanzada', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Text('Tutor: Dr. Carlos Aguilar', style: TextStyle(fontSize: 18)),
              SizedBox(height: 40),
              Text('Integrantes:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text('1. Antonio Duré', style: TextStyle(fontSize: 18)),
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
