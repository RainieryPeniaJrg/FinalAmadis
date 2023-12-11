import 'package:flutter/material.dart';
import 'multas_screen.dart';

class MultaDetailsScreen extends StatelessWidget {
  final Multa multa;

  MultaDetailsScreen({required this.multa});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de la Multa'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Código: ${multa.id}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('Cédula: ${multa.cedula}', style: TextStyle(fontSize: 16)),
            Text('Comentario: ${multa.comentario}',style: TextStyle(fontSize: 16)),
            Text('Placa: ${multa.placaVehiculo}',style: TextStyle(fontSize: 16)),
            Text('Tipo de multa: ${multa.tipoMulta}',style: TextStyle(fontSize: 16)),
            Text('Latidud: ${multa.latitud}',style: TextStyle(fontSize: 16)),
            Text('Longitud: ${multa.longitud}',style: TextStyle(fontSize: 16)),
            Text('Fecha: ${multa.fecha}',style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
