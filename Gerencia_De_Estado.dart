// Nesse projeto é mostrado mostrado como gerenciar o estado de um widget sem que precise
// renderizar a tela toda, usando a classe "ValueNotifier" e o widget "ValueListenableBuilder".

import 'package:flutter/material.dart';
import 'dart:math'; // importa a função Random()

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnePage(),
    );
  }
}

class OnePage extends StatefulWidget {
  const OnePage({Key? key}) : super(key: key);

  @override
  State<OnePage> createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {
  // int valorAleatorio = 0; ANTES
  ValueNotifier<int> valorAleatorio = ValueNotifier<int>(0); // DEPOIS

  random() async {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 1));
      valorAleatorio.value = Random().nextInt(50); // |"value" é um atributo da instancia "valorAleatorio"|
    }                                              // |instanciada da classe "ValueNotifier"              |
  }

  @override
  Widget build(BuildContext context) {
    print('Builder');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Alinha no meio
          children: [
            ElevatedButton(
              onPressed: () {
                random();
              },
              child: Text('Clicar'),
            ),
            SizedBox(height: 10), // cria um espaço entre dois widgets
            ValueListenableBuilder(
              valueListenable: valorAleatorio,// <<-- valor que eu colocaria dentro do SetState()
              builder: (_, valor, __) => Text(// basicamente >> | valor = valorAleatorio
                'O numero Aleatório é: $valor',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
