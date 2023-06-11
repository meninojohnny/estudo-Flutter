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
      home: TodoList(),
    );
  }
}

class TodoList extends StatefulWidget {
  @override
  _TodoList createState() => _TodoList();
}

class _TodoList extends State<TodoList> {
  TextEditingController _input = TextEditingController();
  List<String> tarefas = ['aa', 'bb', 'cc'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
      ), // AppBar
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: _input,
            ),
            Container(
              height: 300,
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: tarefas.length,
                itemBuilder: (context, index) => ListTile(
                    title: Text(tarefas[index]),
                    trailing: Icon(Icons.arrow_forward),
                    onLongPress: () {
                      setState(() {
                        tarefas.removeAt(index);
                      });
                    }), // ListTile
              ), // ListView.builder
            ),
          ],
        ), // Column
      ), // Container
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () {
              if (_input.text.length > 0) {
                setState(() {
                  tarefas.add(_input.text);
                });
                _input.clear();
              }
            },
            child: Icon(Icons.add),
          ), //FloatingActionButton
          FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () {
              setState(() {
                //tarefas = [];
                tarefas.removeLast();
              });
              _input.clear();
            },
            child: Icon(Icons.remove),
          ), //FloatingActionButton
        ],
      ),
    ); // Scaffold
  }
}
