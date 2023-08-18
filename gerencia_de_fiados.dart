import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  EventsController eventsController = EventsController();
  var event;
  setEvent(var event) {this.event = event;}
  
  @override
  Widget build(BuildContext context) {
    event = eventsController.events[0];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(eventsController: eventsController, setEvent: setEvent),
        '/eventPage': (context) => EventPage(event: event),
      },
    ); // MaterialApp
  }
}

class HomePage extends StatefulWidget {
  final EventsController eventsController;
  final Function setEvent;
  const HomePage({Key? key, required this.eventsController, required this.setEvent});
  @override
  _HomePageState createState() => _HomePageState(eventsController: eventsController, setEvent: setEvent);
}

class _HomePageState extends State<HomePage> {
  final EventsController eventsController;
  final Function setEvent;
  String name = '';
  setName(String name) {this.name = name;}
  String date = '';
  setDate(String date) {this.date = date;}
  _HomePageState({Key? key, required this.eventsController, required this.setEvent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 100,
                    color: Colors.grey,
                    child: TextField(
                      onChanged: setName,
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 60,
                    color: Colors.red,
                    child: TextField(
                      onChanged: setDate,
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        eventsController.addEvent(name: name, date: date);
                      });
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      color: Colors.blue,
                    ), // Container
                  ), // GestureDetector
                 
                ],
              ), // Row
              SizedBox(height: 10),
              
              Text(
                'Events',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                itemCount: eventsController.events.length,
                itemBuilder: (context, index) {
                  return makeEvents(eventsController.events[index]);
                },
              ), // ListView
            ],
          ), // Column
        ), // Padding
      ), // SingleChildScrollView
    ); // Scaffold
  }

  Widget makeEvents(event) {
    return GestureDetector(
      onTap: () {
        setState(() {
          setEvent(event);
          Navigator.of(context).pushReplacementNamed('/eventPage');
        });
      },
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(event.name),
            SizedBox(height: 10),
            Text('Data: ${event.date}'),
            SizedBox(height: 10),
            Text('Total fiadores: 0'),
          ],
        ), // Column
      ), // Container
    ); //
  }
}

class EventPage extends StatefulWidget {
  final EventModel event;
  EventPage({Key? key, required this.event});
  @override
  _EventPageState createState() => _EventPageState(event: event);
}

class _EventPageState extends State<EventPage> {
  final EventModel event;
  String name = '';
  setName(String name) {this.name = name;}
  String value = '';
  setValue(String value) {this.value = value;}
  _EventPageState({Key? key, required this.event});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_circle_left),
            onPressed: () {
              setState(() {
                Navigator.of(context).pushReplacementNamed('/');
              });
            }
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(event.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
              SizedBox(height: 5),
              Text('Data: ${event.date}', style: TextStyle(fontSize: 15,),),
              SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    width: 100,
                    color: Colors.grey,
                    child: TextField(
                      onChanged: setName,
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 60,
                    color: Colors.red,
                    child: TextField(
                      onChanged: setValue,
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        event.addPeople(name: name, value: value);
                      });
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      color: Colors.blue,
                    ), // Container
                  ), // GestureDetector
                 
                ],
              ), // Row
              SizedBox(height: 10),
              Text('Peoples', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                itemCount: event.listPeoples.length,
                itemBuilder: (context, index) {
                  return makePeoples(event.listPeoples[index]);
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget makePeoples(var people) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue,
      ),
      child: Text('${people.name} R\$${people.value}'),
    ); // Container
  }
}

class EventsController {
  List events = [
    EventModel(name: 'Venda de lanches', date: '13/06'),
//     {'name': 'Venda de cachorro quente', 'date': '13/07', 'listPeoples': []},
//     {'name': 'Venda de pastel', 'date': '20/08', 'listPeoples': []},
//     {'name': 'Venda de bolo', 'date': '15/09', 'listPeoples': []},
//     {'name': 'Venda de torta', 'date': '31/10', 'listPeoples': []},
  ];
  
  void addEvent({name, date}) {
    events.add(EventModel(name: name, date: date));
  }
}

class EventModel {
  final String name;
  final String date;
  List listPeoples = [PeopleModel(name: 'Joao vitor', value: '100.00')];
  
  EventModel({required this.name, required this.date});
  
  void addPeople({name, value}) {
    listPeoples.add(PeopleModel(name: name, value: value));
  }
}

class PeopleModel {
  final String name;
  final String value;
  PeopleModel({required this.name, required this.value});
}
