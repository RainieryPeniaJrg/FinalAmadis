import 'package:flutter/material.dart';

class InfoConductorScreen extends StatefulWidget {
  @override
  _InfoConductorScreenState createState() => _InfoConductorScreenState();
}

class _InfoConductorScreenState extends State<InfoConductorScreen> {
  TextEditingController licenciaController = TextEditingController();
  String informacionConductor = '';

  void obtenerInformacionConductor() {
    setState(() {
      informacionConductor =
          'Nombre: Juan Romo\nLicencia: ${licenciaController.text}\nEdad: 30\n';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Información del Conductor'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: licenciaController,
              decoration: InputDecoration(
                labelText: 'Licencia del Conductor',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                obtenerInformacionConductor();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
              child: Text('Obtener Información del Conductor'),
            ),
            SizedBox(height: 16),
            informacionConductor.isNotEmpty
                ? Card(
                    elevation: 3,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        informacionConductor,
                        style: TextStyle(fontSize: 16),
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
