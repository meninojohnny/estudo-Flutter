import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Projeto1'),
      ),
      body: Column(children: [
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Center(
            child: Text(
              'Hello world',
              style: TextStyle(
               color: Colors.white,
               fontSize: 30,
              ),
            )
          ),
        ),
        Row(
          children: [
            Container(
              color: Colors.red, 
              height: 200, 
              width: 200,
              child: Center(
                child: Text(
                  'Bloco 1',
                  style: TextStyle(color: Colors.yellow, fontSize: 20),
                ),
              ),
            ),
            Container(
              color: Colors.yellow, 
              height: 200, 
              width: 200,
              child: Center(
                child: Text(
                  'Bloco 2',
                  style: TextStyle(color: Colors.red, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: 'item 1',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_card),
          label: 'item 2',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_alert),
          label: 'item 3',
        ),
      ]),
    );
  }
}
