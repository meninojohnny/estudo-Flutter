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
                Container(width: double.infinity, height: 125, color: Colors.orange),
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
                ),
              ],
            ),
          ), // Container
        ), // Center
      ), // Container
    ); // Scaffold
  }
  
  Widget customBottom({isZero = false, isUp = false, color, text}) {
    return Container(
      width: isZero ? 80 : 37,
      height: 37,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(child: Text(text, style: TextStyle(color: isUp ? Colors.black : Colors.white, fontWeight: FontWeight.bold),),),
    );
  }
  
}
