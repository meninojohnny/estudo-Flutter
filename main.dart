import 'package:flutter/material.dart';

void main(){
  runApp(AppWidget(title: 'Joao vitor'));
}

class AppWidget extends StatelessWidget{
  final String title;
  
  const AppWidget({Key key, this.title = ''}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget{
  @override
  State<HomePage> creatState() {
    return HomePageState();
  }
  
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Joao  vitor')),
    );
  }
}
