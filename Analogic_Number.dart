import 'package:flutter/material.dart';

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
  NumbersController controller = NumbersController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  width: 90,
                  height: 140,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ), // BoxDecoration
                  child: visor(controller: controller.numbers2),
                ), // Container
                SizedBox(width: 20),
                teclado(),
              ],
            ), // Row
          ],
        ),
      ),
    );
  }
  
  Widget visor({controller}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        
        rowBox(row: [controller[0], controller[1], controller[2]]),
        rowBox(row: [controller[3], controller[4], controller[5]]),
        rowBox(row: [controller[6], controller[7], controller[8]]),
        rowBox(row: [controller[9], controller[10], controller[11]]),
        rowBox(row: [controller[12], controller[13], controller[14]]),
      ],
    );
  }
  
  Widget makeBox({color}) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: (color) ? Colors.black : Colors.red,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
  
  Widget rowBox({row}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        makeBox(color: row[0]),
        makeBox(color: row[1]),
        makeBox(color: row[2]),
      ],
    );
  }
  
  Widget teclado() {
    return Container(
      padding: EdgeInsets.all(10),
      width: 90,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ), // BoxDecoration
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          rowNumber(row: [1, 2, 3]),
          rowNumber(row: [4, 5, 6]),
          rowNumber(row: [7, 8, 9]),
          makeNumber(number: 0),
        ],
      ),
    );
  }
  
  Widget rowNumber({row}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        makeNumber(number: row[0]),
        makeNumber(number: row[1]),
        makeNumber(number: row[2]),
      ],
    );
  }
  
  Widget makeNumber({number}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          controller.clear();
          controller.mudar(number);
        });
      },
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3),
        ),
        child: Center(child: Text('${number}'),),
      )
    );
  }
  
}

class NumbersController {
  List combinations = [
    [1, 2, 3, 4, 6, 7, 9, 10, 12, 13, 14, 15], // 0
    [3, 6, 9, 12, 15], // 1
    [1, 2, 3, 6, 9, 8, 7, 10,13,14,15], // 2
    [1, 2, 3, 6, 7, 8, 9, 12, 13, 14, 15], // 3
    [1, 3, 4, 6, 7, 8, 9, 12, 15], // 4
    [1, 2, 3, 4, 9, 8, 7, 12, 13,14,15], // 5
    [1, 2, 3, 4, 9, 8, 7, 10, 12, 13,14,15], // 6
    [1, 2, 3, 6, 9, 12, 15], // 7
    [1, 2, 3, 4, 6, 7, 8, 9, 10, 12, 13, 14, 15], // 8
    [1, 2, 3, 4, 6, 7, 8, 9, 12, 15], // 9
    
  ];
  
  List numbers2 = [
    false, false, false,
    false, false, false,
    false, false, false,
    false, false, false,
    false, false, false,
  ];
  
  void mudar(int number) {
    for (final i in combinations[number]) {
      numbers2[i - 1] = true;
    }
  }
  
  void clear() {
    for (int i = 0;i < numbers2.length; i++) {
      numbers2[i] = false;
    }
  }
  
  
}
