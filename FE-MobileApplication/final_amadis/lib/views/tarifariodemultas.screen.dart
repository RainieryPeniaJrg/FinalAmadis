import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Multa {
  final String descripcion;
  final String detalle;

  Multa({required this.descripcion, required this.detalle});

  factory Multa.fromJson(Map<String, dynamic> json) {
    return Multa(
      descripcion: json['descripcion'],
      detalle: 'Multa por ${json['descripcion'].toLowerCase()}',
    );
  }
}
class TarifarioMultasView extends StatefulWidget {
  @override
  _TarifarioMultasViewState createState() => _TarifarioMultasViewState();
}

class _TarifarioMultasViewState extends State<TarifarioMultasView> {
  List<Multa> multas = [];
  String error = '';

  @override
  void initState() {
    super.initState();
    fetchMultas();
  }

  Future<void> fetchMultas() async {
    try {
      final response = await http.get(
          Uri.parse('https://localhost:7212/api/TipoMulta/get-tipo-multa'));
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
        title: const Text('Tarifario de Multas'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://cdn.buttercms.com/zBVP5KDuTfSHGZg1rT8S'), // Añade tu ruta de imagen
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      body: error.isNotEmpty
          ? Center(
              child: Text(
                error,
                style: TextStyle(color: Colors.red),
              ),
            )
          : MultasList(multas: multas),
    );
  }
}

class MultasList extends StatelessWidget {
  final List<Multa> multas;

  const MultasList({Key? key, required this.multas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: multas.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(multas[index].descripcion),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MultaDetalleView(multa: multas[index]),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class MultaDetalleView extends StatelessWidget {
  final Multa multa;

  const MultaDetalleView({Key? key, required this.multa}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle de Multa'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tipo: ${multa.descripcion}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Text('Detalle: ${multa.detalle}',
                style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

