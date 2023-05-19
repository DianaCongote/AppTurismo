import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';


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
      home: const Appitp(),
      routes: {
        '/hello': (context) => const HelloPage(),
        '/pagina1': (context) => const Pagina1(),
        '/pagina2': (context) => const Pagina2(),
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
  'Los Tambores',
  'Canalendres',
  'Rio Pepino',
  'Piscina la Playita',
  // Agrega más títulos según la cantidad de imágenes
];

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
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
            ),
          ],
        ),
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.green,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Iniciar sesión',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Correo electrónico',
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Contraseña',
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey.shade300,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    title: const Text(
                      'Iniciar sesión',
                      style: TextStyle(fontSize: 18.0),
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/hello');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                "Mocoa Putumayo",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 23.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Expanded(
              child: Container(
                
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (context, position) {
                    if (position == 0) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/pagina1');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            
                            
                            color: Colors.yellow,
                            child: Image.asset(
                              "assets/Mocoa.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    } 
                    return Container();
                  },
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
                          text: "Rios y Cascadas",
                        ),
                        Tab(
                          text: "Gastronomia",
                        ),
                        Tab(
                          text: "Caminatas y Animales",
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 0.8,
                            ),
                            itemCount: 15,
                            itemBuilder: (context, position) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, '/pagina${position + 1}');
                                },
                                child: Container(
                                  width: 200.0,
                                  height: 150.0,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AspectRatio(
                                        aspectRatio: 1.0,
                                        child: Image.asset(
                                          "assets/Imagen${position % 15}.png",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(height: 8.0),
                                      Text(
                                        imageTitles[position],
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          Container(
                            color: Colors.red,
                            height: 50.0,
                          ),
                          Container(
                            color: Colors.green,
                            height: 50.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/hello');
          },
          child: const Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}

class HelloPage extends StatelessWidget {
  const HelloPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hola mundo'),
      ),
      body: const Center(
        child: Text('¡Hola mundo!'),
      ),
    );
  }
}

class Pagina1 extends StatelessWidget {
  const Pagina1({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cascada Hornoyaco'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/cascada_hornoyaco.png",
              height: 500.0,
              width: 400.0,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Información General',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Hornoyaco es una imponente cascada de unos 55 metros de altura aproximadamente. Se ha convertido en uno de los atractivos turísticos naturales que debemos visitar en nuestro viaje por Putumayo.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Dónde queda la Cascada de Hornoyaco',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'La cascada de Hornoyaco queda sobre la vereda el zarzal municipio de Mocoa. Limites con el parque natural de los Churumbelos. Se entrada queda en el km 2 en la vía de Mocoa Conduce a Villagarzón, unos metros antes de Caliyaco.',
              style: TextStyle(fontSize: 16.0),
            ),
            TextButton(
              onPressed: () async {
                // URL de WhatsApp con el número de teléfono o ID del contacto
                String url = 'https://www.google.com/maps/dir/Mocoa,+Putumayo/Ornoyaco,+Mocoa,+Putumayo/@1.132798,-76.6456227,7700m/data=!3m1!1e3!4m13!4m12!1m5!1m1!1s0x8e28b286a74d01f9:0x856c0ee6cd8a160!2m2!1d-76.6481284!2d1.1477941!1m5!1m1!1s0x8e28ade9a492fcb3:0xcaa6d7d8d739be34!2m2!1d-76.6204571!2d1.1169754';

                // Verificar si la app de WhatsApp está instalada en el dispositivo
                if (await canLaunch(url)) {
                  // Abrir WhatsApp
                  await launch(url);
                } else {
                  // No se puede abrir WhatsApp
                  print('No se puede abrir.');
                }
              },
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/maps.svg',
                    width: 24.0,
                    height: 24.0,
                  ),
                  const SizedBox(width: 8.0),
                  const Text(
                    'Ver en Google Maps',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          
            
            const SizedBox(height: 16.0),
            const Text(
              'Al cruzar el puente sobre el rio Mocoa la primera parte del camino es a cielo abierto, pasamos por algunas viviendas de moradores locales, después ya se llega a la parte de camino que esta sobre el bosque.',
               style: TextStyle(fontSize: 16.0),
            ),
            const Text(
              ' ',
              style: TextStyle(fontSize: 16.0),
            ),
            const Text(
              'En el transcurso de la caminata se pasa por dos puentes en madera para sobrepasar pequeñas corrientes de agua (se recomienda observar las medidas de seguridad, no hacer actos que puedan provocar un accidente).',
              style: TextStyle(fontSize: 16.0),
            ),
            const Text(
              ' ',
              style: TextStyle(fontSize: 16.0),
            ),
            const Text(
              'Se llega a la parte superior de la cascada, es esta parte también podemos observar un puente en piedra o roca casi al borde de la cascada hornoyaco, se continua el camino para poder bajar y poder llegar al pozo que forma al caer la cascada. En esta parte del camino se debe ser cuidadoso por ser siempre empinado',
              style: TextStyle(fontSize: 16.0),
            ),
            const Text(
              ' ',
              style: TextStyle(fontSize: 16.0),
            ),
            const Text(
              'Valor ingreso: 5.000',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            
            TextButton(
              onPressed: () async {
                // URL de WhatsApp con el número de teléfono o ID del contacto
                String url = 'https://wa.me/+573112144366';

                // Verificar si la app de WhatsApp está instalada en el dispositivo
                if (await canLaunch(url)) {
                  // Abrir WhatsApp
                  await launch(url);
                } else {
                  // No se puede abrir WhatsApp
                  print('No se puede abrir WhatsApp.');
                }
              },
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/whatsapp_icon.svg',
                    width: 24.0,
                    height: 24.0,
                  ),
                  const SizedBox(width: 8.0),
                  const Text(
                    'Contactar Guia Turista',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}


class Pagina2 extends StatelessWidget {
  const Pagina2({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cascada Fin del Mundo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/findelmundo.png",
              height: 500.0,
              width: 400.0,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Información General',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'El fin del Mundo es una Reserva Natural con hermosas cascadas de aguas cristalinas, ideal para las caminatas entre la selva, natacion en pozos naturales y la observación de especies nativas de flora y fauna. ',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            
            
            const Text(
              'Ubicacion',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Mocoa, Putumayo, vereda San José del Pepino kilometro 6 vía que de Mocoa conduce a Villagarzón',
              style: TextStyle(fontSize: 16.0),
            ),
            TextButton(
              onPressed: () async {
                // URL de WhatsApp con el número de teléfono o ID del contacto
                String url = 'https://www.google.com/maps/dir/Mocoa,+Putumayo/Cascada+Fin+del+Mundo,+Reserva+Fin+del+Mundo,+Km+5,+Mocoa,+Putumayo/@1.1112827,-76.6264581,3242m/data=!3m1!1e3!4m13!4m12!1m5!1m1!1s0x8e28b286a74d01f9:0x856c0ee6cd8a160!2m2!1d-76.6481284!2d1.1477941!1m5!1m1!1s0x8e28b3eca229d52b:0x95987c9ed682be1e!2m2!1d-76.6230371!2d1.102817?hl=es';

                // Verificar si la app de WhatsApp está instalada en el dispositivo
                if (await canLaunch(url)) {
                  // Abrir WhatsApp
                  await launch(url);
                } else {
                  // No se puede abrir WhatsApp
                  print('No se puede abrir.');
                }
              },
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/maps.svg',
                    width: 24.0,
                    height: 24.0,
                  ),
                  const SizedBox(width: 8.0),
                  const Text(
                    'Ver en Google Maps',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          
            const Text(
              'Como llegar',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Desde el sitio donde nos deja el vehículo procedemos a tomar un camino veredal, antes de cruzar el puente de rio Mocoa encontramos el punto de registro, desinfeccion y de informacion. El recorrido total tiene aproximadamente un tiempo de duración entre una hora u hora y media de acuerdo al estado físico de las personas, ',
               style: TextStyle(fontSize: 16.0),
            ),
            Image.asset(
              "assets/entrada.png",
              height: 300.0,
              width: 240.0,
            ),
            const Text(
              ' ',
              style: TextStyle(fontSize: 5.0),
            ),
            const Text(
              'Tras una hora de caminata, una piscina natural anuncia que el Fin del Mundo está cerca. Se le conoce como pozo negro y tiene ocho metros y medio de profundidad. No hay corrientes fuertes ni piedras que impidan un baño a los turistas.',
              style: TextStyle(fontSize: 16.0),
            ),
            Image.asset(
              "assets/cascada1.png",
              height: 300.0,
              width: 240.0,
            ),
            const Text(
              ' ',
              style: TextStyle(fontSize: 5.0),
            ),
            const Text(
              'La siguiente parada es la cascada del Almorzadero, con aguas de hasta tres metros de profundidad. A un costado, escondido bajo una enorme pierda cuya ‘puerta de entrada’ es una refrescante cortina de agua',
              style: TextStyle(fontSize: 16.0),
            ),
            Image.asset(
              "assets/cascada2.png",
              height: 300.0,
              width: 240.0,
            ),
            const Text(
              'Al final del sendero se encuentra la magestuosa cascada de mas de 70 metros ',
              style: TextStyle(fontSize: 16.0),
            ),
            const Text(
              ' ',
              style: TextStyle(fontSize: 16.0),
            ),
            const Text(
              'Valor ingreso adulto 25.000',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Menores de 5 años 10.000',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Disponible compra de comida',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            
            TextButton(
              onPressed: () async {
                // URL de WhatsApp con el número de teléfono o ID del contacto
                String url = 'https://wa.me/+573112144366';

                // Verificar si la app de WhatsApp está instalada en el dispositivo
                if (await canLaunch(url)) {
                  // Abrir WhatsApp
                  await launch(url);
                } else {
                  // No se puede abrir WhatsApp
                  print('No se puede abrir WhatsApp.');
                }
              },
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/whatsapp_icon.svg',
                    width: 24.0,
                    height: 24.0,
                  ),
                  const SizedBox(width: 8.0),
                  const Text(
                    'Contactar Guia Turista',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
