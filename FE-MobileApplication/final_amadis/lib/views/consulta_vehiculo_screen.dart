import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class ConsultaVehiculoScreen extends StatefulWidget {
  @override
  _ConsultaVehiculoScreenState createState() => _ConsultaVehiculoScreenState();
}

class _ConsultaVehiculoScreenState extends State<ConsultaVehiculoScreen> {
  TextEditingController placaController = TextEditingController();
  Vehiculo? informacionVehiculo;
  String apiUrl = 'https://localhost:7212/api/Vehiculo/get-by-placa/';

  void consultarVehiculo() async {
    String placa = placaController.text;
    if (placa.isNotEmpty) {
      try {
        final response = await http.get(Uri.parse(apiUrl + placa));
        if (response.statusCode == 200) {
          final data = Vehiculo.fromJson(jsonDecode(response.body));
          setState(() {
            informacionVehiculo = data;
          });
        } else {
          setState(() {
            informacionVehiculo = null;
          });
        }
      } catch (e) {
        setState(() {
          informacionVehiculo = null;
        });
      }
    } else {
      setState(() {
        informacionVehiculo = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consulta de Vehículo'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: placaController,
              decoration: InputDecoration(
                labelText: 'Placa del Vehículo',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                consultarVehiculo();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
              child: Text('Consultar Vehículo'),
            ),
            SizedBox(height: 16),
            informacionVehiculo != null
                ? Card(
                    elevation: 3,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Placa: ${informacionVehiculo!.placa}'),
                          Text('Color: ${informacionVehiculo!.color}'),
                          Text('Marca: ${informacionVehiculo!.marca}'),
                          Text('Modelo: ${informacionVehiculo!.modelo}'),
                          Text('Año: ${informacionVehiculo!.anio}'),
                        ],
                      ),
                    ),
                  )
                : Container(),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              child: Text('Regresar al Home'),
            ),
          ],
        ),
      ),
    );
  }
}
class Vehiculo {
  final String placa;
  final String color;
  final String marca;
  final String modelo;
  final int anio;

  Vehiculo({
    required this.placa,
    required this.color,
    required this.marca,
    required this.modelo,
    required this.anio,
  });

  factory Vehiculo.fromJson(Map<String, dynamic> json) {
    return Vehiculo(
      placa: json['placa'],
      color: json['color'],
      marca: json['marca'],
      modelo: json['modelo'],
      anio: json['anio'],
    );
  }
}
