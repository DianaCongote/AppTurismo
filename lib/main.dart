import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const WelcomePage(),
      routes: {
        '/lugarespagina1': (context) => const Lugarespagina1(),
        '/lugarespagina2': (context) => const Lugarespagina2(),
        '/lugarespagina3': (context) => const Lugarespagina3(),
        '/lugarespagina4': (context) => const Lugarespagina4(),
        '/lugarespagina5': (context) => const Lugarespagina5(),
        '/lugarespagina6': (context) => const Lugarespagina6(),
        '/lugarespagina7': (context) => const Lugarespagina7(),
        '/lugarespagina8': (context) => const Lugarespagina8(),
        '/lugarespagina9': (context) => const Lugarespagina9(),
        '/lugarespagina10': (context) => const Lugarespagina10(),
        '/lugarespagina11': (context) => const Lugarespagina11(),
        '/lugarespagina12': (context) => const Lugarespagina12(),
        //'/restaurantespagina1': (context) => const Restaurantespagina1(),
        // Agrega más rutas según la cantidad de páginas
      },
    );
  }
}

List<String> imageTitles = [
  'Hornoyaco',
  'Fin del mundo',
  'Cañon del Mandiyaco',
  'El ojo de Dios',
  'Charco el Aguacate',
  'Salto del Indio',
  'Caliyaco',
  'El Golondrino',
  'El Charco del Duende',
  'Donde se Oculta eL Sol',
  'Rincon del Vides',
  'Canalendres',
  // Agrega más títulos según la cantidad de imágenes
];

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/logo.png",
          height: 40.0,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/Mocoa.png",
              height: 200.0,
            ),
            SizedBox(height: 16.0),
            Text(
              "¡Bienvenido!",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Appitp()),
                );
              },
              child: Text(
                "Continuar",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Appitp extends StatelessWidget {
  const Appitp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            "assets/logo.png",
            height: 40.0,
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "La Cordillera de los Andes y la Amazonia Colombiana en un solo lugar: Mocoa Putumayo",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 21.0,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            DefaultTabController(
              length: 3,
              child: Flexible(
                child: Column(
                  children: [
                    TabBar(
                      unselectedLabelColor: Colors.black,
                      indicatorColor: Colors.blue,
                      indicatorWeight: 3.0,
                      tabs: const [
                        Tab(
                          text: "Lugares",
                        ),
                        Tab(
                          text: "Contactenos",
                        ),
                        //Tab(
                        //text: "Hoteles",
                        //),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          LugaresTab(),
                          VideosTab(),
                          //HotelesTab(),
                        ],
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

class LugaresTab extends StatelessWidget {
  const LugaresTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: 12, // Cantidad de elementos en la lista de lugares
      itemBuilder: (context, position) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/lugarespagina${position + 1}');
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: Colors.white,
                width: 2.0,
              ),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: Image.asset(
                      "assets/Imagen${position % 12}.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.black.withOpacity(0.8),
                          Colors.transparent,
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      imageTitles[position], // Títulos de los lugares
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class Lugarespagina1 extends StatelessWidget {
  const Lugarespagina1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cascada Hornoyaco'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                child: Image.asset(
                  "assets/cascada_hornoyaco.png",
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Tipo: Senderismo y cascadas',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Tiempo recorrido: 1 hora',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Distancia: 6 Kilometros',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Venta de comida: No',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Costo: 5.000',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              ' ',
              style: TextStyle(
                fontSize: 5.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Hornoyaco es una imponente cascada de unos 55 metros de altura aproximadamente. Se ha convertido en uno de los atractivos turísticos naturales que debemos visitar en nuestro viaje por Putumayo.',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 24.0),
            Text(
              'Ubicaciòn',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'La cascada de Hornoyaco queda sobre la vereda el zarzal municipio de Mocoa. Limites con el parque natural de los Churumbelos. Se entrada queda en el km 2 en la vía de Mocoa Conduce a Villagarzón, unos metros antes de Caliyaco.',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton.icon(
              onPressed: () async {
                // URL de Google Maps para mostrar la ubicación
                String url =
                    'https://www.google.com/maps/dir/1.1501568,-76.6509056/Hornoyaco,+Mocoa,+Putumayo/@1.1419958,-76.6398434,15z/data=!4m9!4m8!1m1!4e1!1m5!1m1!1s0x8e28ad8903e7d7c5:0xe4648690bdbb1681!2m2!1d-76.6204625!2d1.1169372?hl=es&entry=ttu';

                await launch(url);
              },
              icon: Icon(Icons.map),
              label: Text(
                'Ver en Google Maps',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(16.0),
              ),
            ),
            const SizedBox(height: 24.0),
            Text(
              'Al cruzar el puente sobre el río Mocoa, la primera parte del camino es a cielo abierto, pasamos por algunas viviendas de moradores locales, después ya se llega a la parte de camino que está sobre el bosque.',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              'En el transcurso de la caminata se pasa por dos puentes en madera para sobrepasar pequeñas corrientes de agua (se recomienda observar las medidas de seguridad, no hacer actos que puedan provocar un accidente).',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Se llega a la parte superior de la cascada, en esta parte también podemos observar un puente en piedra o roca casi al borde de la cascada Hornoyaco. Se continúa el camino para poder bajar y poder llegar al pozo que forma al caer la cascada. En esta parte del camino se debe ser cuidadoso por ser siempre empinado.',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                child: Image.asset(
                  "assets/Hornoyaco2.jpg",
                ),
              ),
            ),
            Text(
              ' ',
              style: TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '¿Quieres conocer este lugar?',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton.icon(
              onPressed: () async {
                // URL de WhatsApp con el número de teléfono o ID del contacto
                String url =
                    'https://wa.me/+573112144366?text= Hola, me contacto desde TurisMocoa, estoy interesado(a) en conocer la cascada Hornoyaco. ¿Podrías brindarme información sobre los tours disponibles y sus horarios? ¡Gracias!';
                await launch(url);
                // Verificar si la app de WhatsApp está instalada en el dispositivo
              },
              icon: Icon(Icons.chat),
              label: Text(
                'Contactar Guía Turista',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Lugarespagina2 extends StatelessWidget {
  const Lugarespagina2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fin del mundo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                child: Image.asset(
                  "assets/findelmundo.png",
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Tipo: Senderismo y cascadas',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Tiempo recorrido: 1 hora y 30 minutos',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Distancia: 6 Kilometros',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Venta de comida: Si',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Costo: 25.000',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              ' ',
              style: TextStyle(
                fontSize: 5.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'El fin del Mundo es una Reserva Natural con hermosas cascadas de aguas cristalinas, ideal para las caminatas entre la selva, natacion en pozos naturales y la observación de especies nativas de flora y fauna. ',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 24.0),
            Text(
              'Ubicaciòn',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Mocoa, Putumayo, vereda San José del Pepino kilometro 6 vía que de Mocoa conduce a Villagarzón',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton.icon(
              onPressed: () async {
                // URL de Google Maps para mostrar la ubicación
                String url =
                    'https://www.google.com/maps/dir/Mocoa,+Putumayo/Cascada+Fin+del+Mundo,+Reserva+Fin+del+Mundo,+Km+5,+Mocoa,+Putumayo/@1.1112827,-76.6264581,3242m/data=!3m1!1e3!4m13!4m12!1m5!1m1!1s0x8e28b286a74d01f9:0x856c0ee6cd8a160!2m2!1d-76.6481284!2d1.1477941!1m5!1m1!1s0x8e28b3eca229d52b:0x95987c9ed682be1e!2m2!1d-76.6230371!2d1.102817?hl=es';

                await launch(url);
              },
              icon: Icon(Icons.map),
              label: Text(
                'Ver en Google Maps',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(16.0),
              ),
            ),
            const SizedBox(height: 24.0),
            Text(
              'Desde el sitio donde nos deja el vehículo procedemos a tomar un camino veredal, antes de cruzar el puente de rio Mocoa encontramos el punto de registro, desinfeccion y de informacion. El recorrido total tiene aproximadamente un tiempo de duración entre una hora u hora y media de acuerdo al estado físico de las personas, ',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                child: Image.asset(
                  "assets/entrada.png",
                ),
              ),
            ),
            Text(
              'Tras una hora de caminata, una piscina natural anuncia que el Fin del Mundo está cerca. Se le conoce como pozo negro y tiene ocho metros y medio de profundidad. No hay corrientes fuertes ni piedras que impidan un baño a los turistas.',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              'La siguiente parada es la cascada del Almorzadero, con aguas de hasta tres metros de profundidad. A un costado, escondido bajo una enorme pierda cuya ‘puerta de entrada’ es una refrescante cortina de agua',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                child: Image.asset(
                  "assets/cascada1.png",
                ),
              ),
            ),
            Text(
              ' ',
              style: TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '¿Quieres conocer este lugar?',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton.icon(
              onPressed: () async {
                // URL de WhatsApp con el número de teléfono o ID del contacto
                String url =
                    'https://wa.me/+573112144366?text= Hola, me contacto desde TurisMocoa, estoy interesado(a) en conocer la cascada Fin del mundo. ¿Podrías brindarme información sobre los tours disponibles y sus horarios? ¡Gracias!';
                await launch(url);
                // Verificar si la app de WhatsApp está instalada en el dispositivo
              },
              icon: Icon(Icons.chat),
              label: Text(
                'Contactar Guía Turista',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Lugarespagina3 extends StatelessWidget {
  const Lugarespagina3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cañon del Mandiyaco'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                child: Image.asset(
                  "assets/mandiyaco.jpg",
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Tipo: Senderismo y rios',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Tiempo recorrido: 40 minutos',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Distancia: 25 Kilometros',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Venta de comida: No',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Costo: 2.000',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              ' ',
              style: TextStyle(
                fontSize: 5.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Esta maravilla natural fue generada por el río que atraviesa la formación rocosa de origen volcánica. Aquí el poder del afluente hídrico hace su paso en medio de la roca, lo cual va dejando unos cortes demasiados singulares.',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 24.0),
            Text(
              'Ubicaciòn',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'El Cañón del Mandiyaco está ubicado en el km 25 de la vía que conduce de Mocoa a Pitalito, sobrepasando el puente del río Caquetá, límite natural entre los departamentos de Cauca y Putumayo.',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton.icon(
              onPressed: () async {
                // URL de Google Maps para mostrar la ubicación
                String url =
                    'https://www.google.com/maps/dir/Mocoa,+Putumayo/Ca%C3%B1on+del+Mandiyaco,+Santa+Rosa,+Cauca/@1.2117988,-76.6522198,13z/data=!3m1!4b1!4m13!4m12!1m5!1m1!1s0x8e28b286a74d01f9:0x856c0ee6cd8a160!2m2!1d-76.6481284!2d1.1477941!1m5!1m1!1s0x8e2f511542d16411:0x2dcecde8393343c3!2m2!1d-76.572688!2d1.2736658?hl=es&entry=ttu';

                await launch(url);
              },
              icon: Icon(Icons.map),
              label: Text(
                'Ver en Google Maps',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(16.0),
              ),
            ),
            const SizedBox(height: 24.0),
            Text(
              'Desde Mocoa si no tenemos transporte particular, en la plaza de mercado salen los microbuses que hacen este recorrido o en auto particular unos 40 minutos aproximadamente',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              'El cañón del Mandiyaco se presta para hacer fotografía de paisajismo y colocar a prueba  nuestra mente y cámara, de igual forma se puede observar desde el puente.',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Cambien podemos realizar una caminata por medio de la formación rocosa del Cañón del Mandiyaco.También está la oportunidad siempre y cuando el rio no está crecido de hacer un recorrido en una canoa por todo el cañón lo cual nos da otra m forma de contemplar las magnitud del cañón.',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                child: Image.asset(
                  "assets/mandiyaco2.jpg",
                ),
              ),
            ),
            Text(
              ' ',
              style: TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '¿Quieres conocer este lugar?',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton.icon(
              onPressed: () async {
                // URL de WhatsApp con el número de teléfono o ID del contacto
                String url =
                    'https://wa.me/+573112144366?text= Hola, me contacto desde TurisMocoa, estoy interesado(a) en conocer el Cañon del Mandiyaco. ¿Podrías brindarme información sobre los tours disponibles y sus horarios? ¡Gracias!';
                await launch(url);
                // Verificar si la app de WhatsApp está instalada en el dispositivo
              },
              icon: Icon(Icons.chat),
              label: Text(
                'Contactar Guía Turista',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Lugarespagina4 extends StatelessWidget {
  const Lugarespagina4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('El Ojo de Dios'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                child: Image.asset(
                  "assets/ojodios2.jpg",
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Tipo: Senderismo y Cascadas',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Tiempo recorrido: 3 horas',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Distancia: 25 Kilometros',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Venta de comida: No',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Costo: 15.000',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              ' ',
              style: TextStyle(
                fontSize: 5.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'El Ojo de Dios es una Hermosa Cascada entre la Selva. Se encuentra situada entre grandes árboles, aguas cristalinas y el sonido de las aves nativas y del bosque. Es una formacion rocosa, con un pozo - piscina natural, refrescante y relajante',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 24.0),
            Text(
              'Ubicaciòn',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Cascada Ojo de Dios su ingreso hace por la misma entrada a las Cascadas fin del mundo. Se tiene una caseta de información turística sobre la vía, km 6 vía Mocoa a Villagarzón',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton.icon(
              onPressed: () async {
                // URL de Google Maps para mostrar la ubicación
                String url =
                    'https://www.google.com/maps/dir/Mocoa,+Putumayo/Cascada+Fin+del+Mundo,+Reserva+Fin+del+Mundo,+Km+5,+Mocoa,+Putumayo/@1.1112827,-76.6264581,3242m/data=!3m1!1e3!4m13!4m12!1m5!1m1!1s0x8e28b286a74d01f9:0x856c0ee6cd8a160!2m2!1d-76.6481284!2d1.1477941!1m5!1m1!1s0x8e28b3eca229d52b:0x95987c9ed682be1e!2m2!1d-76.6230371!2d1.102817?hl=es';

                await launch(url);
              },
              icon: Icon(Icons.map),
              label: Text(
                'Ver en Google Maps',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(16.0),
              ),
            ),
            const SizedBox(height: 24.0),
            Text(
              'Lo que hace a este sitio maravilloso, es el efecto creado por la cascada, Si miras hacia arriba verás una inmensa piedra con un agujero en medio por el cual traspasa el agua de la cascada, dando la impresión de que éste fuera su yacimiento. Su altura es de 35 metros.',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                child: Image.asset(
                  "assets/ojodios.jpeg",
                ),
              ),
            ),
            Text(
              ' ',
              style: TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '¿Quieres conocer este lugar?',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton.icon(
              onPressed: () async {
                // URL de WhatsApp con el número de teléfono o ID del contacto
                String url =
                    'https://wa.me/+573112144366?text= Hola, me contacto desde TurisMocoa, estoy interesado(a) en conocer el Ojo de Dios. ¿Podrías brindarme información sobre los tours disponibles y sus horarios? ¡Gracias!';
                await launch(url);
                // Verificar si la app de WhatsApp está instalada en el dispositivo
              },
              icon: Icon(Icons.chat),
              label: Text(
                'Contactar Guía Turista',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Lugarespagina5 extends StatelessWidget {
  const Lugarespagina5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Charco el Aguacate'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                child: Image.asset(
                  "assets/aguacate.jpg",
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Tipo: Senderismo y Rios',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Tiempo recorrido: 30 minutos',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Distancia: 2 Kilometros',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Venta de comida: No',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Costo: Gratis',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              ' ',
              style: TextStyle(
                fontSize: 5.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Pozo el aguacate ubicado en la ciudad de Mocoa en donde se unen los ríos Caliyaco con el río Mocoa. Un lugar para vivir la naturaleza de forma única, además de pasar un rato agradable en familia. Un excelente plan para el fin de semana.',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 24.0),
            Text(
              'Ubicaciòn',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Via Mocoa Villagarzon en el Km 2, se entra por el rio caliyaco, se camina en direccion en la corriente del rio y en 10 minutos se encuentra este hermoso carcho de aguas cristalinas',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton.icon(
              onPressed: () async {
                // URL de Google Maps para mostrar la ubicación
                String url =
                    'https://www.google.com/maps/dir/Mocoa,+Putumayo/1.1244562,-76.6388573/@1.1266765,-76.6319943,2099m/data=!3m1!1e3!4m9!4m8!1m5!1m1!1s0x8e28b286a74d01f9:0x856c0ee6cd8a160!2m2!1d-76.6481284!2d1.1477941!1m0!3e2!5m1!1e4?hl=es&entry=ttu';

                await launch(url);
              },
              icon: Icon(Icons.map),
              label: Text(
                'Ver en Google Maps',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(16.0),
              ),
            ),
            const SizedBox(height: 24.0),
            const SizedBox(height: 8.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                child: Image.asset(
                  "assets/aguacate.png",
                ),
              ),
            ),
            Text(
              ' ',
              style: TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '¿Quieres conocer este lugar?',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton.icon(
              onPressed: () async {
                // URL de WhatsApp con el número de teléfono o ID del contacto
                String url =
                    'https://wa.me/+573112144366?text= Hola, me contacto desde TurisMocoa, estoy interesado(a) en conocer el Charco Aguacate. ¿Podrías brindarme información sobre los tours disponibles y sus horarios? ¡Gracias!';
                await launch(url);
                // Verificar si la app de WhatsApp está instalada en el dispositivo
              },
              icon: Icon(Icons.chat),
              label: Text(
                'Contactar Guía Turista',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Lugarespagina6 extends StatelessWidget {
  const Lugarespagina6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salto del Indio'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                child: Image.asset(
                  "assets/saltoindio.png",
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Tipo: Senderismo y cascadas',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Tiempo recorrido: 1 hora',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Distancia: 20 Kilometros',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Venta de comida: No',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Costo: 8.000',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              ' ',
              style: TextStyle(
                fontSize: 5.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Esta maravilla de la naturaleza formada por una quebrada que se convierte en dos hermosas cascadas que luego se depositan sobre el lecho del río formando un lugar de esparcimiento realmente maravilloso. La transferencia y claridad de sus aguas, de color verde-azulado y la magnificencia del paisaje a su alrededor',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 24.0),
            Text(
              'Ubicaciòn',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Charco del Indio o salto del indio, su ingreso se hace por el municipio de Villagarzón, aunque pertenece al municipio de Mocoa. Es uno de los atractivos que debes tener en cuenta en tu viaje al Putumayo. Las aguas del Charco del Indio o Salto del Indio se caracterizan por su color verde esmeralda',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton.icon(
              onPressed: () async {
                // URL de Google Maps para mostrar la ubicación
                String url =
                    'https://www.google.com/maps/dir/Mocoa,+Mocoa,+Putumayo/Salto+Del+Indio,+Mocoa,+Putumayo/@1.0893659,-76.6616979,13z/data=!3m1!4b1!4m14!4m13!1m5!1m1!1s0x8e28b286a74d01f9:0x856c0ee6cd8a160!2m2!1d-76.6481284!2d1.1477941!1m5!1m1!1s0x8e28af765283fc37:0x8680b91b2bbf28e9!2m2!1d-76.5928679!2d1.0415433!3e0?hl=es&entry=ttu';

                await launch(url);
              },
              icon: Icon(Icons.map),
              label: Text(
                'Ver en Google Maps',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(16.0),
              ),
            ),
            const SizedBox(height: 24.0),
            Text(
              'Salto del Indio o Cascada del Indio, esta ubicada aproximadamente a 10 minutos de Villagarzón, una cascada de 7 metros de altura con una piscina natural que invita al turista a conectar con la naturaleza y su entorno. Sus colores verdes resaltan y enamoran. Visita este bellísimo sitio que nos regala la madre tierra, es un plan perfecto para una aventura inolvidable.',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                child: Image.asset(
                  "assets/saltoindio.jpg",
                ),
              ),
            ),
            Text(
              ' ',
              style: TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '¿Quieres conocer este lugar?',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton.icon(
              onPressed: () async {
                // URL de WhatsApp con el número de teléfono o ID del contacto
                String url =
                    'https://wa.me/+573112144366?text= Hola, me contacto desde TurisMocoa, estoy interesado(a) en conocer el salto del indio. ¿Podrías brindarme información sobre los tours disponibles y sus horarios? ¡Gracias!';
                await launch(url);
                // Verificar si la app de WhatsApp está instalada en el dispositivo
              },
              icon: Icon(Icons.chat),
              label: Text(
                'Contactar Guía Turista',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Lugarespagina7 extends StatelessWidget {
  const Lugarespagina7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Caliyaco'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                child: Image.asset(
                  "assets/caliyaco.jpg",
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Tipo: Senderismo y Rios',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Tiempo recorrido: 7 minutos',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Distancia: 3 Kilometros',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Venta de comida: Si',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Costo: Gratis',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              ' ',
              style: TextStyle(
                fontSize: 5.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'El famoso Rio Rumiyaco - Caliyaco ofrece sus deliciosas aguas a propios y visitantes. Con muchos pozos para elejir se constituye en uno de los principales planes para los paseos de fines de semana.',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 24.0),
            Text(
              'Ubicaciòn',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Mocoa, Putumayo, vereda Rumiyaco kilometro 3 vía que de Mocoa conduce a Villagarzón',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton.icon(
              onPressed: () async {
                // URL de Google Maps para mostrar la ubicación
                String url =
                    'https://www.google.com/maps/dir/Mocoa,+Mocoa,+Putumayo/Parador+Caliyaco,+Mocoa,+Putumayo/@1.1365205,-76.6531368,15z/data=!3m1!4b1!4m14!4m13!1m5!1m1!1s0x8e28b286a74d01f9:0x856c0ee6cd8a160!2m2!1d-76.6481284!2d1.1477941!1m5!1m1!1s0x8e28ad8afc42dd67:0xf7c177587feb69e4!2m2!1d-76.6386451!2d1.1251926!3e0?hl=es&entry=ttu';

                await launch(url);
              },
              icon: Icon(Icons.map),
              label: Text(
                'Ver en Google Maps',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(16.0),
              ),
            ),
            const SizedBox(height: 24.0),
            Text(
              'En la via que conduce de Mocoa a Vigarzon, a tan solo 7 minutos se encuentra en puente del rio Caliyaco, donde se puede desender facilmente y disfrutar cualquier lugar de este maravilloso rio',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Caliyaco es uno de los sitios más simbólicos y distinguidos que tiene la capital. Culturalmente se consolido el nombre tal cual está al presente y que por hábito sigue estando vigente en la mayoría de la localidad que generalmente lo visitan o que lo conocen.',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                child: Image.asset(
                  "assets/caliyaco1.jpg",
                ),
              ),
            ),
            Text(
              ' ',
              style: TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '¿Quieres conocer este lugar?',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton.icon(
              onPressed: () async {
                // URL de WhatsApp con el número de teléfono o ID del contacto
                String url =
                    'https://wa.me/+573112144366?text= Hola, me contacto desde TurisMocoa, estoy interesado(a) en conocer El rio Caliyaco. ¿Podrías brindarme información sobre los tours disponibles y sus horarios? ¡Gracias!';
                await launch(url);
                // Verificar si la app de WhatsApp está instalada en el dispositivo
              },
              icon: Icon(Icons.chat),
              label: Text(
                'Contactar Guía Turista',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Lugarespagina8 extends StatelessWidget {
  const Lugarespagina8({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('El Golondrino'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                child: Image.asset(
                  "assets/golondrino.jpg",
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Tipo: Senderismo y Cascadas',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Tiempo recorrido: 30 minutos',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Distancia: 6 Kilometros',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Venta de comida: No',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Costo: Gratis',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              ' ',
              style: TextStyle(
                fontSize: 5.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Es una pequeña cascada ubicada en la vereda los Andes, por un sitio conocido como el lagarto, a tan solo unos 20 minutos de caminata muy suave. Es ideal para un día que se disponga de poco tiempo y se desee hacer un poco de senderismo y visitar un atractivo turístico.',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 24.0),
            Text(
              'Ubicaciòn',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Ubicado en Mocoa Putumayo Vereda los andes, entrada por la vereda Rumiyaco',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton.icon(
              onPressed: () async {
                // URL de Google Maps para mostrar la ubicación
                String url =
                    'https://www.google.com/maps/dir/Mocoa,+Mocoa,+Putumayo/Cascada+El+Golondrino+El+gran+boio+Mocoa,+Putumayo/@1.1391462,-76.6557727,14z/data=!4m13!4m12!1m5!1m1!1s0x8e28b286a74d01f9:0x856c0ee6cd8a160!2m2!1d-76.6481284!2d1.1477941!1m5!1m1!1s0x8e28b211ace6feb1:0x554736d6ce1cbde6!2m2!1d-76.6742313!2d1.1112218?entry=ttu';

                await launch(url);
              },
              icon: Icon(Icons.map),
              label: Text(
                'Ver en Google Maps',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(16.0),
              ),
            ),
            const SizedBox(height: 24.0),
            Text(
              'Desde Mocoa se toma la via que conduce a San Francisco, posterior a el rio Rumiyaco se pasa una escuela y mano derecha toma la via destapada, de ahi avanza unos 10 minutos a donde se encuentra la entrada, se realiza una caminata corta de 20 minutos',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              'En la cascada Golondrino podemos realizar fotografía de paisajismo y disfrutar de la naturaleza, es un lugar tranquilizante y muy hermoso.',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                child: Image.asset(
                  "assets/golondrino1.jpg",
                ),
              ),
            ),
            Text(
              ' ',
              style: TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '¿Quieres conocer este lugar?',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton.icon(
              onPressed: () async {
                // URL de WhatsApp con el número de teléfono o ID del contacto
                String url =
                    'https://wa.me/+573112144366?text= Hola, me contacto desde TurisMocoa, estoy interesado(a) en conocer el Golondrino. ¿Podrías brindarme información sobre los tours disponibles y sus horarios? ¡Gracias!';
                await launch(url);
                // Verificar si la app de WhatsApp está instalada en el dispositivo
              },
              icon: Icon(Icons.chat),
              label: Text(
                'Contactar Guía Turista',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Lugarespagina9 extends StatelessWidget {
  const Lugarespagina9({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('El Charco del Duende'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                child: Image.asset(
                  "assets/cuevaduende.jpg",
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Tipo: Senderismo y Cascadas',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Tiempo recorrido: 1 hora y 30 minutos',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Distancia: 20 Kilometros',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Venta de comida: No',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Costo: 25.000',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              ' ',
              style: TextStyle(
                fontSize: 5.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Charco del duende es un destino natural impresionante. Es un lugar rodeado de exuberante naturaleza, con cascadas, cuevas y lagos de aguas cristalinas de color verde esmeralda. Se resalta la belleza y la magia del lugar, así como la energía increíble que se experimenta allí.',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 24.0),
            Text(
              'Ubicaciòn',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'La Cueva del duende tiene su ingreso por la misma entrada a el salto del indio, se llega a el municipio de villagarzon, en la entrada a mano derecha dirigiendose para el rio Mocoa, para que tengas una ruta detalla sige la ruta por google maps ',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton.icon(
              onPressed: () async {
                // URL de Google Maps para mostrar la ubicación
                String url =
                    'https://www.google.com/maps/dir/Mocoa,+Mocoa,+Putumayo/Cascada+del+duende,+Villagarz%C3%B3n,+Mocoa,+Putumayo/@1.0893659,-76.6606228,13z/data=!3m1!4b1!4m14!4m13!1m5!1m1!1s0x8e28b286a74d01f9:0x856c0ee6cd8a160!2m2!1d-76.6481284!2d1.1477941!1m5!1m1!1s0x8e28af915e135f89:0x9607fc00ce2f2625!2m2!1d-76.5907178!2d1.0502969!3e0?hl=es&entry=ttu';

                await launch(url);
              },
              icon: Icon(Icons.map),
              label: Text(
                'Ver en Google Maps',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(16.0),
              ),
            ),
            const SizedBox(height: 24.0),
            Text(
              'llegar a un destino natural como el Charco del duente puede implicar un viaje emocionante y aventurero. A menudo, estos lugares están ubicados en áreas rurales o remotas, rodeados de paisajes naturales impresionantes.',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                child: Image.asset(
                  "assets/cuevaduende1.jpg",
                ),
              ),
            ),
            Text(
              ' ',
              style: TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '¿Quieres conocer este lugar?',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton.icon(
              onPressed: () async {
                // URL de WhatsApp con el número de teléfono o ID del contacto
                String url =
                    'https://wa.me/+573112144366?text= Hola, me contacto desde TurisMocoa, estoy interesado(a) en conocer La cueva del duende. ¿Podrías brindarme información sobre los tours disponibles y sus horarios? ¡Gracias!';
                await launch(url);
                // Verificar si la app de WhatsApp está instalada en el dispositivo
              },
              icon: Icon(Icons.chat),
              label: Text(
                'Contactar Guía Turista',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Lugarespagina10 extends StatelessWidget {
  const Lugarespagina10({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donde se Oculta el Sol'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                child: Image.asset(
                  "assets/ocultasol.jpg",
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Tipo: Senderismo y Cascadas',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Tiempo recorrido: 1 hora',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Distancia: 22 Kilometros',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Venta de comida: Si',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Costo: Gratis',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              ' ',
              style: TextStyle(
                fontSize: 5.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'La reserva permite a propios y visitantes gozar de cascadas y de las historias de cada uno de los lugares ancestrales como experiencia de conexión con los ancestros indígenas.',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 24.0),
            Text(
              'Ubicaciòn',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Donde se oculta el Sol, está ubicado en el municipio de Villagarzón en  Putumayo, en el kilómetro 7 Vía a la vereda la Kofania y rincón de vides, cuenta con senderos interpretativos para realizar caminatas o trekking de 2 kilómetros de distancia cada uno de los senderos para llegar hasta las cascadas. ',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton.icon(
              onPressed: () async {
                // URL de Google Maps para mostrar la ubicación
                String url =
                    'https://www.google.com/maps/dir/Mocoa,+Mocoa,+Putumayo/Reserva+Natural+Donde+se+oculta+el+sol,+Villagarz%C3%B3n,+Putumayo/@1.0767453,-76.7204588,12z/data=!3m1!4b1!4m14!4m13!1m5!1m1!1s0x8e28b286a74d01f9:0x856c0ee6cd8a160!2m2!1d-76.6481284!2d1.1477941!1m5!1m1!1s0x8e28bb5fd54142b9:0x690c72e267e2fbd1!2m2!1d-76.6606871!2d1.0058221!3e0?hl=es&entry=ttu';

                await launch(url);
              },
              icon: Icon(Icons.map),
              label: Text(
                'Ver en Google Maps',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(16.0),
              ),
            ),
            const SizedBox(height: 24.0),
            Text(
              'Asociación integrada por mujeres y jóvenes rurales, madres cabeza de hogar, adultos mayores y víctimas, todos dedicados a promover el turismo rural a través de actividades como senderismo, avistamiento de aves, monos y anfibios, recorridos seguros por zonas de aventura, además de servicios de alojamiento en una casa típica amazónica, camping y alimentación con platos típicos de Putumayo.',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                child: Image.asset(
                  "assets/ocultasol1.jpg",
                ),
              ),
            ),
            Text(
              ' ',
              style: TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '¿Quieres conocer este lugar?',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton.icon(
              onPressed: () async {
                // URL de WhatsApp con el número de teléfono o ID del contacto
                String url =
                    'https://wa.me/+573112144366?text= Hola, me contacto desde TurisMocoa, estoy interesado(a) en conocer Donde se Oculta el Sol. ¿Podrías brindarme información sobre los tours disponibles y sus horarios? ¡Gracias!';
                await launch(url);
                // Verificar si la app de WhatsApp está instalada en el dispositivo
              },
              icon: Icon(Icons.chat),
              label: Text(
                'Contactar Guía Turista',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Lugarespagina11 extends StatelessWidget {
  const Lugarespagina11({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rincon del vides'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                child: Image.asset(
                  "assets/vides.jpg",
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Tipo: Senderismo y cascadas',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Tiempo recorrido: 2 horas',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Distancia: 37 Kilometros',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Venta de comida: Si',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Costo: 25.000',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              ' ',
              style: TextStyle(
                fontSize: 5.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'el Rincon del Vides hace honor a ser la esmeralda mas pura del Putumayo, sus aguas cristalinas, puras y de una temperatura ideal, hacen que toda la travesía para llegar hasta este espectacular sitio valgan la pena.',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 24.0),
            Text(
              'Ubicaciòn',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'El rincón del Vides es un atractivo turistico ubicado en el municipio de VillaGarzon Putumayo. Podrás disfrutar de una caminata en medio de la naturaleza y al llegar al destino te sorprenderás al ver el color de las agua verde esmeralda del rio, podrás tomar un baño, relajarte y difrutar el paisaje',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton.icon(
              onPressed: () async {
                // URL de Google Maps para mostrar la ubicación
                String url =
                    'https://www.google.com/maps/place/Centro+Tur%C3%ADstico+El+Rinc%C3%B3n+del+Vides/@1.0434671,-76.7463194,11.75z/data=!4m23!1m16!4m15!1m6!1m2!1s0x8e28b286a74d01f9:0x856c0ee6cd8a160!2sMocoa,+Putumayo!2m2!1d-76.6481284!2d1.1477941!1m6!1m2!1s0x8e28bf3bb9571961:0xdb339b5a50f8815f!2sCentro+Tur%C3%ADstico+El+Rinc%C3%B3n+del+Vides,+Villagarz%C3%B3n,+Putumayo!2m2!1d-76.7706283!2d0.8966349!3e2!3m5!1s0x8e28bf3bb9571961:0xdb339b5a50f8815f!8m2!3d0.8966349!4d-76.7706283!16s%2Fg%2F11fr796_sm?hl=es&entry=ttu';

                await launch(url);
              },
              icon: Icon(Icons.map),
              label: Text(
                'Ver en Google Maps',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(16.0),
              ),
            ),
            const SizedBox(height: 24.0),
            Text(
              'El sitio está ubicado en zona rural, vereda Alto vides a 27 km de Villagarzon – Putumayo. El horario de ingreso al lugar es de 8:00am a 1:00pm y la hora de salida es 3:40pm.',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Al llegar al destino es impresionante ver el color de sus agua verde esmeralda, en ocasiones podemos ver los peces en sus aguas. tiene partes altas donde se puede lanzar o hacer barraquismo, se puede llevar un flotador para disfrutar en sus aguas o simplemente nadamos',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                child: Image.asset(
                  "assets/vides1.jpg",
                ),
              ),
            ),
            Text(
              ' ',
              style: TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '¿Quieres conocer este lugar?',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton.icon(
              onPressed: () async {
                // URL de WhatsApp con el número de teléfono o ID del contacto
                String url =
                    'https://wa.me/+573112144366?text= Hola, me contacto desde TurisMocoa, estoy interesado(a) en conocer el Rincon del Vides. ¿Podrías brindarme información sobre los tours disponibles y sus horarios? ¡Gracias!';
                await launch(url);
                // Verificar si la app de WhatsApp está instalada en el dispositivo
              },
              icon: Icon(Icons.chat),
              label: Text(
                'Contactar Guía Turista',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Lugarespagina12 extends StatelessWidget {
  const Lugarespagina12({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Canalendre'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                child: Image.asset(
                  "assets/canalendre.jpg",
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Tipo: Senderismo y cascadas',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Tiempo recorrido: 30 minutos',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Distancia: 4 Kilometros',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Venta de comida: No',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Costo: Gratis',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              ' ',
              style: TextStyle(
                fontSize: 5.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Destino turistico de  Mocoa, un sitio especial para conocer y pasar un buen momento rodeado de naturaleza y agua con una serie de cascadas simultaneas',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 24.0),
            Text(
              'Ubicaciòn',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'El ingreso para llegar a esta  hermosa cascada se encuentra a 10 minutos de Mocoa, por la  vía Mocoa -  Villagarzón,  la cual esta conformada por dos balnearios: uno en la sima de la cascada y otro en la parte final de ella',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton.icon(
              onPressed: () async {
                // URL de Google Maps para mostrar la ubicación
                String url =
                    'https://www.google.com/maps/dir/Mocoa,+Putumayo/CANALENDRE,+45,+Mocoa,+Putumayo/@1.1370271,-76.6411663,15z/data=!4m14!4m13!1m5!1m1!1s0x8e28b286a74d01f9:0x856c0ee6cd8a160!2m2!1d-76.6481284!2d1.1477941!1m5!1m1!1s0x8e28ad64328585ab:0xaf7bf347de3d276a!2m2!1d-76.627681!2d1.1297322!3e0?hl=es&entry=ttu';

                await launch(url);
              },
              icon: Icon(Icons.map),
              label: Text(
                'Ver en Google Maps',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(16.0),
              ),
            ),
            const SizedBox(height: 24.0),
            Text(
              'Al cruzar el puente sobre el río Mocoa, se toma el camino a mano izquierda, se camina al rededor de 15 minutos y se puede difrutar de los diferentes pozos naturales que ofrece este rio, en su parte principal se encuentra de una hermosa cascada de aguas cristalinas',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                child: Image.asset(
                  "assets/canalendre1.jpg",
                ),
              ),
            ),
            Text(
              ' ',
              style: TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '¿Quieres conocer este lugar?',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton.icon(
              onPressed: () async {
                // URL de WhatsApp con el número de teléfono o ID del contacto
                String url =
                    'https://wa.me/+573112144366?text= Hola, me contacto desde TurisMocoa, estoy interesado(a) en conocer la cascada Canalendre. ¿Podrías brindarme información sobre los tours disponibles y sus horarios? ¡Gracias!';
                await launch(url);
                // Verificar si la app de WhatsApp está instalada en el dispositivo
              },
              icon: Icon(Icons.chat),
              label: Text(
                'Contactar Guía Turista',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VideosTab extends StatefulWidget {
  const VideosTab({Key? key}) : super(key: key);

  @override
  _VideosTabState createState() => _VideosTabState();
}

class _VideosTabState extends State<VideosTab> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _siteController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _siteController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String name = _nameController.text;
      String phone = _phoneController.text;
      String site = _siteController.text;
      String description = _descriptionController.text;

      String message =
          'Nombre: $name\nTeléfono: $phone\nSitio: $site\nDescripción: $description';

      _sendMessage(message);

      _nameController.clear();
      _phoneController.clear();
      _siteController.clear();
      _descriptionController.clear();
    }
  }

  void _sendMessage(String message) {
    //String whatsappUrl =
    //'https://wa.me/+573112144366text=${Uri.encodeComponent(message)}';
    String emailUrl =
        'mailto:dianacongote00@gmail.com?subject=Nuevo sitio&body=${Uri.encodeComponent(message)}';

    // Choose either WhatsApp or email based on your preference
    //launch(whatsappUrl);
    launch(emailUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '¿Quieres que agregemos otro sitio?',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.0),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(labelText: 'Nombre'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, ingresa tu nombre';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(labelText: 'Teléfono'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, ingresa tu teléfono';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: _siteController,
                      decoration: InputDecoration(labelText: 'Sitio'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, ingresa el sitio';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: _descriptionController,
                      decoration:
                          InputDecoration(labelText: 'Descripción del sitio'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, ingresa la descripción del sitio';
                        }
                        return null;
                      },
                      maxLines:
                          null, // Permite que el campo de texto se ajuste automáticamente al contenido
                    ),
                    SizedBox(height: 24.0),
                    ElevatedButton(
                      onPressed: _submitForm,
                      child: Text(
                        'Enviar',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 40.0,
                          vertical: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Apoyando el Turismo y el desarrollo económico de nuestra región',
                style: TextStyle(
                  fontSize: 12.0,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'Diana Congote & Albeiro Chindoy',
                style: TextStyle(
                  fontSize: 12.0,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
