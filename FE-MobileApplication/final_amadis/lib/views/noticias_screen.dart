import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:html/parser.dart' show parse;
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class Noticia {
  final String titular;
  final String imagenUrl;
  final String contenido;

  Noticia(
      {required this.titular,
      required this.imagenUrl,
      required this.contenido});

  factory Noticia.fromJson(Map<String, dynamic> json) {
    return Noticia(
      titular: json['title']['rendered'],
      imagenUrl: json['jetpack_featured_media_url'],
      contenido: json['content']['rendered'],
    );
  }
}

class NoticiasScreen extends StatefulWidget {
  const NoticiasScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NoticiasScreenState createState() => _NoticiasScreenState();
}

class _NoticiasScreenState extends State<NoticiasScreen> {
  List<Noticia> noticias = [];

  @override
  void initState() {
    super.initState();
    _cargarNoticias();
  }

  Future<void> _cargarNoticias() async {
    final response = await http.get(
        Uri.parse('https://remolacha.net/wp-json/wp/v2/posts?search=digeset'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      setState(() {
        noticias = data.map((item) => Noticia.fromJson(item)).toList();
      });
    } else {
      throw Exception('Error al cargar las noticias');
    }
  }

  String _parseHtml(String htmlString) {
    final document = parse(htmlString);
    return parse(document.body!.text).documentElement!.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Noticias Importantes'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: noticias.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    noticias[index].titular,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Image.network(
                    noticias[index].imagenUrl,
                    height: 200.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 8.0),
                  HtmlWidget(
                    _parseHtml(noticias[index].contenido),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
