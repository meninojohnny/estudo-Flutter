import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
  print('Hello World');
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Counter());
  }
}

class Counter extends StatefulWidget {
  @override
  _Counter createState() => _Counter();
}

class _Counter extends State<Counter> {
  int contador = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Clique para aumentar o contador',
              style: TextStyle(fontSize: 15),
            ),
            Text(
              '$contador',
              style: TextStyle(fontSize: 35),
            ),
          ],
        ),
      ),
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
          onPressed: () {
            setState(() {
              contador++;
            });
          },
          child: Icon(Icons.add),
        ),
        FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: () {
            setState(() {
              if (contador > 0) {
                contador--;
              }
            });
          },
          child: Icon(Icons.remove),
        ),
      ]),
    );
  }
}
