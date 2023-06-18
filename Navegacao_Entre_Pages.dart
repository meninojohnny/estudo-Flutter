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
      initialRoute: '/',
      routes: {
        '/': (context) => PageOne(args: 'Page 2'),
        '/pageTwo': (context) => PageTwo(args: 'Page 1'),
      },
    );
  }
}

class PageOne extends StatelessWidget {
  final String args;

  PageOne({Key? key, required this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/pageTwo');
          },
          child: Text('Ir para Page 2'),
        ),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  final String args;

  PageTwo({Key? key, required this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/');
          },
          child: Text('Ir pra $args'),
        ),
      ),
    );
  }
}
