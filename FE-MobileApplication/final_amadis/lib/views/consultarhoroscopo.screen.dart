import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConsultadehoroscopoWidget extends StatefulWidget {
  const ConsultadehoroscopoWidget({Key? key}) : super(key: key);

  @override
  _ConsultadehoroscopoWidgetState createState() =>
      _ConsultadehoroscopoWidgetState();
}

class _ConsultadehoroscopoWidgetState extends State<ConsultadehoroscopoWidget> {
  late TextEditingController _textController;
  late FocusNode _textFieldFocusNode;
  String? _selectedSign;
  String? _horoscopeResult;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _textFieldFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _textController.dispose();
    _textFieldFocusNode.dispose();
    super.dispose();
  }

  Future<void> _fetchHoroscope() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://localhost:7212/api/Horoscopo/daily?sign=$_selectedSign'),
      );

      if (response.statusCode == 200) {
        setState(() {
          _horoscopeResult = response.body;
        });
      } else {
        // Manejar el caso en que la solicitud no sea exitosa
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      // Manejar errores de conexión
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
          'Consulta tu horóscopo',
          style: TextStyle(
            fontFamily: 'Outfit',
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        actions: const [],
        flexibleSpace: FlexibleSpaceBar(
          background: Image.network(
            'https://estaticos-cdn.prensaiberica.es/clip/3b49103e-c171-4954-a0af-410e11c3b80c_16-9-discover-aspect-ratio_default_0.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: DropdownButtonFormField<String>(
                        value: _selectedSign,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedSign = newValue;
                          });
                        },
                        items: [
                          'Aries',
                          'Tauro',
                          'Géminis',
                          'Cáncer',
                          'Leo',
                          'Virgo',
                          'Libra',
                          'Escorpio',
                          'Sagitario',
                          'Capricornio',
                          'Acuario',
                          'Piscis',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        decoration: const InputDecoration(
                          hintText: 'Selecciona tu signo',
                          prefixIcon: Icon(
                            Icons.date_range,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_selectedSign != null) {
                          await _fetchHoroscope();
                          if (_horoscopeResult != null) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Horóscopo del día'),
                                content: Text(_horoscopeResult!),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Cerrar'),
                                  ),
                                ],
                              ),
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text('Consultar'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}







