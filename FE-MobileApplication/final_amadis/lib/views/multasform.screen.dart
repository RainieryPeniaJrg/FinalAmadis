import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FormmultasWidget extends StatefulWidget {
  const FormmultasWidget({Key? key}) : super(key: key);

  @override
  _FormmultasWidgetState createState() => _FormmultasWidgetState();
}

class _FormmultasWidgetState extends State<FormmultasWidget> {
  late TextEditingController _textController1;
  late TextEditingController _textController2;
  late TextEditingController _textController3;
  late TextEditingController _textController4;
  late TextEditingController _textController5;

  late FocusNode _textFieldFocusNode1;
  late FocusNode _textFieldFocusNode2;
  late FocusNode _textFieldFocusNode3;
  late FocusNode _textFieldFocusNode4;
  late FocusNode _textFieldFocusNode5;

  String apiUrl = 'https://localhost:7212/api/Multas';

  @override
  void initState() {
    super.initState();
    _textController1 = TextEditingController();
    _textController2 = TextEditingController();
    _textController3 = TextEditingController();
    _textController4 = TextEditingController();
    _textController5 = TextEditingController();

    _textFieldFocusNode1 = FocusNode();
    _textFieldFocusNode2 = FocusNode();
    _textFieldFocusNode3 = FocusNode();
    _textFieldFocusNode4 = FocusNode();
    _textFieldFocusNode5 = FocusNode();
  }

  @override
  void dispose() {
    _textController1.dispose();
    _textController2.dispose();
    _textController3.dispose();
    _textController4.dispose();
    _textController5.dispose();

    _textFieldFocusNode1.dispose();
    _textFieldFocusNode2.dispose();
    _textFieldFocusNode3.dispose();
    _textFieldFocusNode4.dispose();
    _textFieldFocusNode5.dispose();

    super.dispose();
  }

  Future<void> enviarMultas() async {
    final Map<String, dynamic> multaData = {
      'cedula': _textController1.text,
      'motivoMultaId': int.parse(_textController3.text),
      'vehiculoId': int.parse(_textController2.text),
      'comentario': _textController3.text,
      'latitud': double.parse(_textController4.text),
      'longitud': double.parse(_textController5.text),
      'fecha': DateTime.now().toUtc().toIso8601String(),
      'placaVehiculo': '1', // Agrega el valor adecuado
      'tipoMulta': '1', // Agrega el valor adecuado
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(multaData),
      );

      if (response.statusCode == 200) {
        // La solicitud fue exitosa, puedes manejar la respuesta aquí si es necesario
        print('Multas enviadas exitosamente');
      } else {
        // La solicitud no fue exitosa, manejar según sea necesario
        print(
            'Error al enviar multas. Código de estado: ${response.statusCode}');
      }
    } catch (e) {
      // Manejar el error en la conexión o la solicitud
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.7),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Page Title',
          style: TextStyle(
            fontFamily: 'Outfit',
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        actions: const [],
        flexibleSpace: FlexibleSpaceBar(
          background: Image.network(
            'https://www.ambitojuridico.com/sites/default/files/2023-08/comparendos%28gov%29.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        top: true,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[200],
          ),
          child: Stack(
            children: [
              Positioned(
                top: 20,
                left: 16,
                right: 16,
                child: TextFormField(
                  controller: _textController1,
                  focusNode: _textFieldFocusNode1,
                  autofocus: true,
                  obscureText: false,
                  decoration: const InputDecoration(
                    hintText: 'Cedula',
                    prefixIcon: FaIcon(
                      FontAwesomeIcons.solidAddressCard,
                    ),
                  ),
                  style: const TextStyle(fontSize: 16),
                  validator: (value) {
                    // Add your validation logic here
                    return null;
                  },
                ),
              ),
              Positioned(
                top: 100,
                left: 16,
                right: 16,
                child: TextFormField(
                  controller: _textController2,
                  focusNode: _textFieldFocusNode2,
                  autofocus: true,
                  obscureText: false,
                  decoration: const InputDecoration(
                    hintText: 'Matricula',
                    prefixIcon: FaIcon(
                      FontAwesomeIcons.carSide,
                    ),
                  ),
                  style: const TextStyle(fontSize: 16),
                  validator: (value) {
                    // Add your validation logic here
                    return null;
                  },
                ),
              ),
              Positioned(
                top: 180,
                left: 16,
                right: 16,
                child: TextFormField(
                  controller: _textController3,
                  focusNode: _textFieldFocusNode3,
                  autofocus: true,
                  obscureText: false,
                  decoration: const InputDecoration(
                    hintText: 'Motivo de multa',
                    prefixIcon: FaIcon(
                      // ignore: deprecated_member_use
                      FontAwesomeIcons.fileAlt,
                    ),
                  ),
                  style: const TextStyle(fontSize: 16),
                  validator: (value) {
                    // Add your validation logic here
                    return null;
                  },
                ),
              ),
              Positioned(
                top: 260,
                left: 16,
                right: 16,
                child: TextFormField(
                  controller: _textController4,
                  focusNode: _textFieldFocusNode4,
                  autofocus: true,
                  obscureText: false,
                  decoration: const InputDecoration(
                    hintText: 'Longitud',
                    prefixIcon: Icon(
                      Icons.location_on,
                    ),
                  ),
                  style: const TextStyle(fontSize: 16),
                  validator: (value) {
                    // Add your validation logic here
                    return null;
                  },
                ),
              ),
              Positioned(
                top: 340,
                left: 16,
                right: 16,
                child: TextFormField(
                  controller: _textController5,
                  focusNode: _textFieldFocusNode5,
                  autofocus: true,
                  obscureText: false,
                  decoration: const InputDecoration(
                    hintText: 'Latitud',
                    prefixIcon: Icon(
                      Icons.location_on,
                    ),
                  ),
                  style: const TextStyle(fontSize: 16),
                  validator: (value) {
                    // Add your validation logic here
                    return null;
                  },
                ),
              ),
              Positioned(
                top: 420,
                left: 100,
                child: ElevatedButton(
                  onPressed: () {
                    // ignore: avoid_print
                    print('Seleccionar imagen pressed');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Color del botón
                  ),
                  child: const Text('Seleccionar imagen'),
                ),
              ),
              Positioned(
                top: 480,
                left: 100,
                child: ElevatedButton(
                  onPressed: () {
                    enviarMultas();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Color del botón
                  ),
                  child: const Text('Enviar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}








