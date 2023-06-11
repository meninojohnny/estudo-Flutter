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

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Projeto1'),
      ),
      body: PageView(controller: _pageController, children: [
        PageOne(),
        PageTwo(),
        PageTree(),
      ]),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexPage,
          onTap: (int index) {
            setState(() {
              indexPage = index;
            });
            _pageController.jumpToPage(index);
          },
          items: [
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

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Center(
            child: Text(
          'Page 1',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        )),
      ),
      Row(
        children: [
          Container(
            color: Colors.red,
            height: 200,
            width: 200,
            child: Center(
              child: Text(
                'Page 2',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
          Container(
            color: Colors.yellow,
            height: 200,
            width: 200,
            child: Center(
              child: Text(
                'Page 3',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
        ],
      ),
    ]);
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: Text(
          'Page 2',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }
}

class PageTree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: Text(
          'Page 3',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }
}
