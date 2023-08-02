import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ),);
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State {
  
  CalculatorController _controller = CalculatorController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(10),
            height: 360,
            width: 190,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: double.infinity, 
                  height: 125, 
                  color: Colors.orange,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: SingleChildScrollView(
                      child: Text(
                        _controller.numberView == '' ? '0' : _controller.numberView,
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                  ),
                ), // Containe1
                Container(
                  width: double.infinity, 
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customBottom(isUp: true, color: Colors.grey, text: 'AC'),
                          customBottom(isUp: true, color: Colors.grey, text: '+/-'),
                          customBottom(isUp: true, color: Colors.grey, text: '%'),
                          customBottom(color: Colors.orange, text: '/'),
                        ],
                      ),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customBottom(color: Colors.grey.withOpacity(.3), text: '7'),
                          customBottom(color: Colors.grey.withOpacity(.3), text: '8'),
                          customBottom(color: Colors.grey.withOpacity(.3), text: '9'),
                          customBottom(color: Colors.orange, text: 'x'),
                        ],
                      ),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customBottom(color: Colors.grey.withOpacity(.3), text: '4'),
                          customBottom(color: Colors.grey.withOpacity(.3), text: '5'),
                          customBottom(color: Colors.grey.withOpacity(.3), text: '6'),
                          customBottom(color: Colors.orange, text: '-'),
                        ],
                      ),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customBottom(color: Colors.grey.withOpacity(.3), text: '1'),
                          customBottom(color: Colors.grey.withOpacity(.3), text: '2'),
                          customBottom(color: Colors.grey.withOpacity(.3), text: '3'),
                          customBottom(color: Colors.orange, text: '+'),
                        ],
                      ),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customBottom(isZero: true, color: Colors.grey.withOpacity(.3), text: '0'),
                          customBottom(color: Colors.grey.withOpacity(.3), text: '.'),
                          customBottom(color: Colors.orange, text: '='),
                        ],
                      ),
                      
                    ],
                  ),
                ), // Containe2
              ],
            ),
          ), // Container
        ), // Center
      ), // Container
    ); // Scaffold
  }
  
  Widget customBottom({isZero = false, isUp = false, color, text}) {
    List numbers = ['1', '2', '3', '4', '5', '6', '7', '8','9', '0'];
    List operations = ['+', '-', '/'];
    return GestureDetector(
      onTap: () {
        setState(() {
          if (numbers.contains(text)) {
            print(_controller.add);
            
            if (_controller.igual == true) {
              _controller.igual = false;
              _controller.numberView = '';
            }
            
            _controller.numberView += text;
            
          } else if (text == 'AC') {
            _controller.numberView = '';
          } else if (operations.contains(text)) {
            
            _controller.number1 = _controller.numberView;
            _controller.numberView = '';
            
            if (text == '+') {
              _controller.add == true;
              _controller.sub == false;
              _controller.mul == false;
              _controller.div == false;
              
            } else if (text == '-') {
              _controller.add == false;
              _controller.sub == true;
              _controller.mul == false;
              _controller.div == false;
              
            } else if (text == 'x') {
              _controller.add == false;
              _controller.sub == false;
              _controller.mul == true;
              _controller.div == false;
              
            } else if (text == '/') {
              _controller.add == false;
              _controller.sub == false;
              _controller.mul == false;
              _controller.div == true;
            } 
            
          } else if (text == '=') {
            _controller.igual = true;
            _controller.number2 = _controller.numberView;
            
            if (_controller.number1 != '') {
                if (_controller.add == true) {
                _controller.numberView = '${int.parse(_controller.number1) + int.parse(_controller.number2)}';
              } else if (_controller.sub == true) {
                _controller.numberView = '${int.parse(_controller.number1) - int.parse(_controller.number2)}';
              } else if (_controller.mul == true) {
                _controller.numberView = '${int.parse(_controller.number1) * int.parse(_controller.number2)}';
              } else if (_controller.div == true) {
                _controller.numberView = '${int.parse(_controller.number1) / int.parse(_controller.number2)}';
              }
            } 
            
            
            
            
          }
          
        });
      },
      child: Container(
        width: isZero ? 80 : 37,
        height: 37,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(child: Text(text, style: TextStyle(color: isUp ? Colors.black : Colors.white, fontWeight: FontWeight.bold),),),
      ),
    );
  }
}

class CalculatorController {
  String numberView = '';
  String number1 = '';
  String number2 = '';
  bool add = true;
  bool sub = true;
  bool mul = true;
  bool div = true;
  bool igual = false;
  
}
