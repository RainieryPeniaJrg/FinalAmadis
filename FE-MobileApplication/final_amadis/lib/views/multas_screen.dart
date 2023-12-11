import 'package:final_amadis/views/multa_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MultasScreen extends StatefulWidget {
  @override
  _MultasScreenState createState() => _MultasScreenState();
}

class _MultasScreenState extends State<MultasScreen> {
  List<Multa> multas = [];
  String error = '';

  @override
  void initState() {
    super.initState();
    // Llamar a la función para cargar las multas desde la API al iniciar la pantalla
    fetchMultas();
  }

  Future<void> fetchMultas() async {
    try {
      // Utiliza HTTPS para ambas peticiones
      final response = await http.get
      (Uri.parse('https://localhost:7212/api/Multas'),
      headers: {'Content-Type': 'application/json'},
     
      );
      print(response.body); 
      if (response.statusCode == 200) {
        List<dynamic> multasJson = jsonDecode(response.body);
        setState(() {
          multas = multasJson.map((json) => Multa.fromJson(json)).toList();
          error = '';
        });
      } else {
        setState(() {
          error = 'Failed to load multas';
        });
      }
    } catch (e) {
      setState(() {
        error = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multas Registradas'),
        backgroundColor: Colors.green,
      ),
      body: error.isNotEmpty
          ? Center(
              child: Text(
                error,
                style: TextStyle(color: Colors.red),
              ),
            )
          : ListView.builder(
              itemCount: multas.length,
              itemBuilder: (context, index) {
                final multa = multas[index];
                return ListTile(
                  title: Text(
                    'Código: ${multa.id}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                      'Cédula: ${multa.cedula}\nMotivo: ${multa.comentario}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MultaDetailsScreen(multa: multa),
                      ),
                    );
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.home),
      ),
    );
  }
}
class Multa {
  final int id;
  final String cedula;
  final int motivoMultaId;
  final int vehiculoId;
  final String comentario;
  final double latitud;
  final double longitud;
  final DateTime fecha;
  final String placaVehiculo;
  final String tipoMulta;

  Multa({
    required this.id,
    required this.cedula,
    required this.motivoMultaId,
    required this.vehiculoId,
    required this.comentario,
    required this.latitud,
    required this.longitud,
    required this.fecha,
    required this.placaVehiculo,
    required this.tipoMulta,
  });

  factory Multa.fromJson(Map<String, dynamic> json) {
    return Multa(
      id: json['id'],
      cedula: json['cedula'],
      motivoMultaId: json['motivoMultaId'],
      vehiculoId: json['vehiculoId'],
      comentario: json['comentario'],
      latitud: json['latitud'],
      longitud: json['longitud'],
      fecha: DateTime.parse(json['fecha']),
      placaVehiculo: json['placaVehiculo'],
      tipoMulta: json['tipoMulta'],
    );
  }
}
