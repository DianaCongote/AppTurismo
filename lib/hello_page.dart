import 'package:flutter/material.dart';

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
