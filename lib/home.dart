

import 'package:flutter/material.dart';
import 'main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('HOME', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildIcon('assets/multa.png', 'Tarifario de multas', context),
                const SizedBox(width: 30), // Espacio adicional
                buildIcon('assets/placa.png', 'Consulta de vehículos por placa',
                    context),
              ],
            ),
            const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildIcon('assets/aplicarm.png', 'Aplicar multa', context),
                const SizedBox(width: 80), // Espacio adicional
                buildIcon(
                    'assets/multasreg.png', 'Multas registradas', context),
              ],
            ),
            const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildIcon('assets/mapa.png', 'Mapa de multas', context),
                const SizedBox(width: 80), // Espacio adicional
                buildIcon('assets/noticias.jpg', 'Noticias', context),
              ],
            ),
            const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildIcon('assets/clima.png', 'Estado del clima', context),
                const SizedBox(width: 80), // Espacio adicional
                buildIcon('assets/horoscopo.png', 'Horóscopo', context),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const MyApp()));
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.logout),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  Widget buildIcon(String imagePath, String text, BuildContext context) {
    return InkWell(
      onTap: () {
        print("klk");
        // Acción al hacer clic en el icono
        // Puedes navegar a la vista correspondiente aquí
      },
      child: Column(
        children: [
          Image.asset(imagePath, width: 80, height: 80),
          const SizedBox(height: 10),
          Text(text),
        ],
      ),
    );
  }
}
