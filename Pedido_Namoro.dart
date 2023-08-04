import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => HomePage(),
      '/yesPage': (context) => YesPage(),
    },
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 250,
          width: 250,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Box1(),
        ),
      ),
    );
  }
}

class Box1 extends StatefulWidget {
  @override
  _Box1State createState() => _Box1State();
}

class _Box1State extends State {
  double value1 = 170;
  double value2 = 95;

  @override
  Widget build(BuildContext contexte) {
    return Container(
      child: 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Transform.translate(
                offset: Offset(value1, value2),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      while (true) {
                        value1 = Random().nextDouble() * 1000;
                        value2 = Random().nextDouble() * 1000;
                        if (value1 < 200 && value2 < 200) {
                          break;
                        }
                      }
                    });
                  },
                  child: Container(
                    height: 30,
                    width: 50,
                    
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Center(child: Text('Não')),
                  ),
                ),
              ), // Transform
              
              Transform.translate(
                offset: Offset(50, 0),
                child: Container(child: Text('Quer namorar comigo?'),),
              ),
              

              Transform.translate(
                offset: Offset(30, 50),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed('/yesPage');
                  },
                  child: Container(
                    height: 30,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Center(child: Text('Sim')),
                  ), //Container2
                ),
              ),
            ],
          ),
    );
  }
}

class YesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: Container(
        height: 250,
        width: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue,
        ),
      ),
    )
    );
  }
}
