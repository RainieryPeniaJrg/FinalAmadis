import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Multa {
  final String tipo;
  final String detalle;
  final String imageUrl;

  Multa({required this.tipo, required this.detalle, required this.imageUrl});
}

class MapaScreenWidget extends StatelessWidget {
  final List<Multa> multas = [
    Multa(
      tipo: 'Primera multa',
      detalle: 'Descripción de multa. Aquí irán los detalles más a fondo acerca de la multa en cuestión.',
      imageUrl: 'https://cdn.buttercms.com/zBVP5KDuTfSHGZg1rT8S',
    ),
    // Agrega más multas según sea necesario
  ];

   MapaScreenWidget({super.key});

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
          'Mapa de multas',
          style: TextStyle(
            fontFamily: 'Open Sans',
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
        flexibleSpace: FlexibleSpaceBar(
          background: Image.network(
            'https://cdn.buttercms.com/zBVP5KDuTfSHGZg1rT8S',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              for (final multa in multas)
                Card(
                  margin: const EdgeInsets.all(16),
                  clipBehavior: Clip.antiAlias,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetalledemultaWidget(multa: multa),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            multa.tipo,
                            style: const TextStyle(
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            multa.detalle,
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetalledemultaWidget extends StatelessWidget {
  final Multa multa;

  const DetalledemultaWidget({Key? key, required this.multa}) : super(key: key);

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
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
        flexibleSpace: FlexibleSpaceBar(
          background: ClipRect(
            child: Image.network(
              multa.imageUrl,
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
                  color: Colors.grey[200],
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





