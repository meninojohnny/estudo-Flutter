import 'package:flutter/material.dart';

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
  double value1 = 0;
  double value2 = 0;

  @override
  Widget build(BuildContext contexte) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(height: 30,width: 50,color: Colors.red,), // Container1
          GestureDetector(
            onTap: () {
              setState(() {
                value1 = 10;
              });
            }, 
            child: Transform.translate(
              offset: Offset(value1, value2),
              child: Container(height: 30,width: 50,color: Colors.red,), //Container2
            ),
          ),
        ],
      ),
    );
  }
}
