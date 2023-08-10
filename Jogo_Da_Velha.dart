import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  ); // runApp
  
  
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State {
  GameController controller = GameController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue,
            ), // BoxDecoration
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomRow(row: controller.game[0]),
                Container(height: 10, width: 290, color: Colors.black),
                CustomRow(row: controller.game[1]),
                Container(height: 10, width: 290, color: Colors.black),
                CustomRow(row: controller.game[2]),
              ],
            ),
          ), // Container
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {controller.reset();});
            },
            child: Text('Reset'),
          ),
        ],
      ), // Column
    ); // Scaffold
  }

  Widget CustomRow({row}) {
    return Row(
      children: [
        CustomBox(value: row[0]['value'], index: row[0]['index']),
        Container(width: 10, height: 90, color: Colors.black),
        CustomBox(value: row[1]['value'], index: row[1]['index']),
        Container(width: 10, height: 90, color: Colors.black),
        CustomBox(value: row[2]['value'], index: row[2]['index']),
      ],
    );
  } // row

  Widget CustomBox({value, index}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          controller.setValue(index);
          
        });
      },
      child: Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.red,
        ), // BoxDecoration
        child: Center(child: Text(value, style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),),
      ), // Container
    );
  }
}

class GameController {
  int count = 0;
  List game = [
    [{'value': '', 'index': 1}, {'value': '', 'index': 2}, {'value': '', 'index': 3}],
    [{'value': '', 'index': 4}, {'value': '', 'index': 5}, {'value': '', 'index': 6}],
    [{'value': '', 'index': 7}, {'value': '', 'index': 8}, {'value': '', 'index': 9}],
  ];
  
  setValue(int index) {
    for (int i = 0; i < game.length; i++) {
      for (int j = 0; j < game[i].length; j++) {
        if (game[i][j]['index'] == index) {
          if (verify(i, j)) {
            game[i][j]['value'] = 'X';
            count++;
            if (count < 9) {
              player();
            }
          }
        }
      }
    }
       
    
  } // setValue
  
  void player() {
    bool control = true;
    int number = 0;
    while (control) {
      number = Random().nextInt(9) + 1;
      for (int i = 0; i < game.length; i++) {
        for (int j = 0; j < game[i].length; j++) {
          if (game[i][j]['index'] == number) {
            if (verify(i, j)) {
              game[i][j]['value'] = 'O';
              control = false;
              count++;
            }
          }
        }
      }
    }
  }
  
  bool verify(int i, int j) {
    if (game[i][j]['value'] == '') {
      return true;
    } else {
      return false;
    }
  }
  
  void reset() {
    count = 0;
    for (int i = 0;i< game.length; i++) {
      for (int j = 0;j < game[i].length;j++) {
        game[i][j]['value'] = '';
      }
    }
  }
  
}
