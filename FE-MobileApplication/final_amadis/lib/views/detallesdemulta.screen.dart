import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetalledemultaWidget extends StatefulWidget {
  const DetalledemultaWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DetalledemultaWidgetState createState() => _DetalledemultaWidgetState();
}

class _DetalledemultaWidgetState extends State<DetalledemultaWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue, // Change to your AppBar color
        automaticallyImplyLeading: false,
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
          'Detalles de la multa',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: const [],
        flexibleSpace: FlexibleSpaceBar(
          background: ClipRect(
            child: Image.network(
              'https://img.canal1.com.co/wp-content/uploads/2021/09/14083244/multas-de-tra%CC%81nsito.jpg?format=auto&width=1200',
              fit: BoxFit.cover,
              alignment: const Alignment(0.00, 0.00),
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Align(
              alignment: const Alignment(-0.01, -0.71),
              child: Container(
                width: 345,
                height: 533,
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Change to your background color
                ),
                child: const Stack(
                  children: [
                    Align(
                      alignment: Alignment(0.00, -1.00),
                      child: Text(
                        'Primera multa',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.00, -0.78),
                      child: Text(
                        'Aquí irán los detalles más a fondo acerca de la multa en cuestión.',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
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
