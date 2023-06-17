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
        '/': (context) => PageOne(),
      },
    );
  }
}

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: CustomButtonWidget(
          onPressed: () {
            print('Funcionando');
          },
          title: 'Clicar Aqui',
          //disable: true,
          fontSize: 50,
        ),
      ),
    );
  }
}

class CustomButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final bool disable;
  final double fontSize;

  const CustomButtonWidget({
    Key? key,
    required this.onPressed,
    required this.title,
    this.fontSize = 20,
    this.disable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disable ? null : onPressed,
      child: Text(title),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) return Colors.grey;
          if (states.contains(MaterialState.pressed)) return Colors.green;
        }),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        textStyle: MaterialStateProperty.all(TextStyle(fontSize: fontSize)),
      ),
    );
  }
}
