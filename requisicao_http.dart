import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

  callAPI() async {
    var client = http.Client();
    try {
      var response = await client.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );
      var decodedResponse = jsonDecode(response.body);
      print(await client.get(decodedResponse));
    } finally {
      client.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Alinha no meio
          children: [
            ElevatedButton(
              onPressed: () => callAPI(),
              child: Text('Clicar'),
            ),
            SizedBox(height: 10), // cria um espaço entre dois widgets
            /*ValueListenableBuilder(
              valueListenable:
                  valorAleatorio, // <<-- valor que eu colocaria dentro do SetState()
              builder: (_, valor, __) => Text(
                // basicamente >> | valor = valorAleatorio
                'O numero Aleatório é: $valor',
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
