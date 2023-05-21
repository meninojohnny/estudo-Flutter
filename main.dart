import 'package:flutter/material.dart';

void main(){
  runApp(AppWidget('Joao vitor'));
}

class AppWidget extends StatelessWidget{
  var title;
  
  AppWidget([this.title]);
  
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
