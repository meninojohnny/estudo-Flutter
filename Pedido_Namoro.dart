import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State {
  var box = Box1();

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
          child: box,
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
  double value2 = 80;

  @override
  Widget build(BuildContext contexte) {
    return Container(
      child: Stack(
        children: [
          Container(
            height: 250,
            width: 250,
            child: Image.network('https://lh3.googleusercontent.com/mUuQy1PsIC2Mq1_ZGlUYP2pgY65qmMuNop5Ts1aKbWyMxNSrI8AEBdE-u26nnDDaAek'),),
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
                    color: Colors.green,
                  ),
                ),
              ), // Transform

              Transform.translate(
                offset: Offset(30, 50),
                child: Container(
                  height: 30,
                  width: 50,
                  color: Colors.red,
                ), //Container2
              ),
            ],
          ),
        ],
      ),
    );
  }
}
