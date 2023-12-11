// main.dart

import 'package:final_amadis/views/consulta_vehiculo_screen.dart';
import 'package:final_amadis/views/consultarhoroscopo.screen.dart';
import 'dart:io';
import 'package:final_amadis/views/info_conductor_screen.dart';
import 'package:final_amadis/views/mapa.screen.dart';
import 'package:final_amadis/views/multas_screen.dart';
import 'package:final_amadis/views/multasform.screen.dart';
import 'package:final_amadis/views/noticias_screen.dart';
import 'package:final_amadis/views/tarifariodemultas.screen.dart';
import 'package:flutter/material.dart';
import 'home.dart'; 

void main() {
  runApp(const MyApp());
  HttpClient()
    ..badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
        


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login', 
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/horoscopo': (context) => const ConsultadehoroscopoWidget(),
        '/noticias': (context) => const NoticiasScreen(),
        '/mapa-multa': (context) => MapaScreenWidget(),
        '/multas-tarifario': (context) =>  TarifarioMultasView(),
        '/aplicar-multa': (context) => const FormmultasWidget(),
        '/info-conductor': (context) =>  InfoConductorScreen(),
        '/vehiculo': (context) => ConsultaVehiculoScreen(), 
        '/multas' : (context) => MultasScreen()
       
      },
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.green,
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final bool _loginError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Inicio de Sesión',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.07,
            child: Image.asset(
              'assets/PORTADA.jpg',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _usernameController,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    labelText: 'Usuario',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                TextField(
                  controller: _passwordController,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    labelText: 'Contraseña',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text('Iniciar Sesión',
                      style: TextStyle(color: Colors.white)),
                ),
                if (_loginError)
                  const Text(
                    'Error: No se pudo iniciar sesión. Verifica tus credenciales.',
                    style: TextStyle(color: Colors.red),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
