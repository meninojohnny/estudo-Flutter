import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  EventsController eventsController = EventsController();
  var event;
  setEvent(var event) {
    this.event = event;
  }

  @override
  Widget build(BuildContext context) {
    event = eventsController.events[0];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) =>
            HomePage(eventsController: eventsController, setEvent: setEvent),
        '/eventPage': (context) => EventPage(event: event, eventsController: eventsController),
      },
    ); // MaterialApp
  }
}

class HomePage extends StatefulWidget {
  final EventsController eventsController;
  final Function setEvent;
  const HomePage(
      {Key? key, required this.eventsController, required this.setEvent});
  @override
  _HomePageState createState() =>
      _HomePageState(eventsController: eventsController, setEvent: setEvent);
}

class _HomePageState extends State<HomePage> {
  final EventsController eventsController;
  final Function setEvent;
  String name = '';
  setName(String name) {
    this.name = name;
  }

  String date = '';
  setDate(String date) {
    this.date = date;
  }

  _HomePageState(
      {Key? key, required this.eventsController, required this.setEvent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              CustomTextField(
                  label: 'Adicionar evento',
                  setValue1: setName,
                  setValue2: setDate,
                  onPressed: () {
                    setState(() {
                      eventsController.addEvent(name: name, date: date);
                    });
                  }),
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
          Navigator.of(context).pushNamed('/eventPage');
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
            Text('Total fiadores: ${event.numberPeoples}'),
          ],
        ), // Column
      ), // Container
    ); //
  }
}

class EventPage extends StatefulWidget {
  final EventModel event;
  final EventsController eventsController;
  EventPage({Key? key, required this.event, required this.eventsController});
  @override
  _EventPageState createState() => _EventPageState(event: event, eventsController: eventsController);
}

class _EventPageState extends State<EventPage> {
  final EventsController eventsController;
  final EventModel event;
  String name = '';
  setName(String name) {
    this.name = name;
  }

  String value = '';
  setValue(String value) {
    this.value = value;
  }

  _EventPageState({Key? key, required this.event, required this.eventsController});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.delete, color: Colors.black),
            onPressed: () {
              eventsController.removeEvent(event);
              Navigator.of(context).pushReplacementNamed('/');
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
              Text(
                event.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Data: ${event.date}',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 20),
              CustomTextField(
                  label: 'Adicionar pessoa',
                  setValue1: setName,
                  setValue2: setValue,
                  onPressed: () {
                    setState(() {
                      event.addPeople(name: name, value: value);
                    });
                  }),
              SizedBox(height: 20),
              Text(
                'Peoples',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: event.listPeoples.length,
                  itemBuilder: (context, index) {
                    return makePeoples(event.listPeoples[index]);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget makePeoples(var people) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(people.name),
              SizedBox(width: 20),
              Text('R\$ ${people.value}'),
            ],
          ), // Row
          GestureDetector(
              onTap: () {
                setState(() {
                  event.removePeople(people);
                });
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.delete, color: Colors.black),
              ),
            ),
        ],
      ), // Row
    ); // Container
  }
}

class EventsController {
  List events = [
    EventModel(name: 'Venda de lanches', date: '13/06'),
  ];

  void addEvent({name, date}) {
    events.insert(0, EventModel(name: name, date: date));
  }
  
  void removeEvent(EventModel event) {
    events.removeAt(events.indexOf(event));
  }
}

class EventModel {
  final String name;
  final String date;
  List<PeopleModel> listPeoples = [PeopleModel(name: 'Joao vitor', value: '100.00')];
  int numberPeoples = 1;

  EventModel({required this.name, required this.date});

  void addPeople({name, value}) {
    listPeoples.add(PeopleModel(name: name, value: value));
    numberPeoples++;
  }
  
  void removePeople(PeopleModel people) {
    listPeoples.removeAt(listPeoples.indexOf(people));
    numberPeoples--;
  }
}

class PeopleModel {
  final String name;
  final String value;
  PeopleModel({required this.name, required this.value});
}

class CustomTextField extends StatelessWidget {
  final Function(String) setValue1;
  final Function(String) setValue2;
  final void Function()? onPressed;
  final String label;

  CustomTextField(
      {Key? key,
      required this.onPressed,
      required this.setValue1,
      required this.setValue2,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 100,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  onChanged: setValue1,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ), // InputDecoration
                ),
              ), // Container
              //SizedBox(width: 10),
              Container(
                width: 60,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  onChanged: setValue2,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ), // InputDecoration
                ),
              ), // Container
              //SizedBox(width: 10),
              GestureDetector(
                onTap: onPressed,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ), // BoxDecoration
                  child: Icon(Icons.add, color: Colors.white),
                ), // Container
              ), // GestureDetector
            ],
          ), // Row;
        ],
      ),
    );
  }
}
