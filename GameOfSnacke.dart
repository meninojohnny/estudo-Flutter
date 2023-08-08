import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State {
  GameController controller = GameController();

  Map coordCobra = {'top': 0, 'left': 0};
  Map coordComida = {'top': 100, 'left': 100};

  @override
  Widget build(BuildContext context) {
    if (controller.verificar(coordCobra, coordComida)) {
      setState(() {
        controller.gerarPosi();
        coordComida['top'] = controller.top;
        coordComida['left'] = controller.left;
      });
    }
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            cobra(),
            comida(),
            Transform.translate(
              offset: Offset(0, 415),
              child: Container(
                height: 120,
                width: double.infinity,
                color: Colors.red,
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    GestureDetector(
                      // UP
                      onTap: () {
                        setState(() {
                          
                          if (coordCobra['top'] > 0) {
                            coordCobra['top'] -= 10;
                          }   
                          
                        });

                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ), // BoxDecoration
                        child: Center(
                          child: Icon(Icons.arrow_circle_up,
                              size: 30, color: Colors.black),
                        ),
                      ), // Container
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          // LEFT
                          onTap: () {
                            setState(() {
                              if (coordCobra['left'] > 0) {
                                coordCobra['left'] -= 10;
                              }
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ), // BoxDecoration
                            child: Center(
                              child: Icon(Icons.arrow_circle_left,
                                  size: 30, color: Colors.black),
                            ),
                          ), // Container
                        ),
                        GestureDetector(
                          // DOWN
                          onTap: () {
                            if (coordCobra == coordComida) {
                              print('pegou');
                            }
                            setState(() {
                              if (coordCobra['top'] < 415) {
                                coordCobra['top'] += 10;
                              }
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ), // BoxDecoration
                            child: Center(
                              child: Icon(Icons.arrow_circle_down,
                                  size: 30, color: Colors.black),
                            ),
                          ), // Container
                        ),
                        GestureDetector(
                          // RIGHT
                          onTap: () {
                            setState(() {
                              if (coordCobra['left'] <
                                  MediaQuery.of(context).size.width) {
                                coordCobra['left'] += 10;
                              }
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ), // BoxDecoration
                            child: Center(
                              child: Icon(Icons.arrow_circle_right,
                                  size: 30, color: Colors.black),
                            ),
                          ), // Container
                        ),
                      ],
                    ),
                  ],
                ), // Column
              ),
            ),
          ],
        ),
      ),
    ); // Scaffold
  }

  Widget cobra() {
    return Transform.translate(
      // Cobra
      offset: Offset(coordCobra['left'], coordCobra['top']),
      child: Container(
        height: 10,
        width: 10,
        color: Colors.black,
      ),
    );
  }

  Widget comida() {
    return Transform.translate(
      // Cobra
      offset: Offset(coordComida['left'], coordComida['top']),
      child: Container(
        height: 10,
        width: 10,
        color: Colors.white,
      ),
    );
  }
}

class GameController {
  double top = 0;
  double left = 0;
  
  void gerarPosi() {
      top = Random().nextInt(20) * 10;
      left = Random().nextInt(20) * 10;
  }
  
  bool verificar(Map cobra, Map comida) {
    if (cobra['top'] == (comida['top'] + 10) && cobra['left'] == comida['left']) {
      gerarPosi();
      return true;
    } else {
      return false;
    }
  }
  
  
}
  
  
  
  
