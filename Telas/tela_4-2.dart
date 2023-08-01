import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()
    
  );
}

class MyApp extends StatelessWidget {
  
  PersonController _controller = PersonController();
  
  @override
  Widget build(context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      initialRoute: '/addCardPage',
      routes: {
        '/': (context) => HomePage(_transitions: _controller),
        '/addCardPage': (context) => AddCardPage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  
  final PersonController _transitions;
  HomePage({Key? key, required this._transitions});
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State {
  PersonController _transitions = PersonController();
  int userId = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Home Page',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/addCardPage');
            },
          ),
        ],
      ), // AppBar
      body: Container(
        color: Colors.white.withOpacity(.9),
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          // mesmo que o ListView, mas com apenas um filho
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _transitions.cards.length,
                  itemBuilder: (context, index) {
                    return creditCard(
                      name: _transitions.cards[index]['cardName'],
                      value: _transitions.cards[index]['currency'],
                    );
                  }
                ), // ListView
              ), // Container
              SizedBox(height: 20),
              Text(
                'Last Transations',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(height: 15),
              Container(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemCount: _transitions.transitions[0].length,
                  itemBuilder: (context, index) {
                    return transationsCard(
                        description: _transitions.transitions[userId][index]
                            ['description'],
                        value: _transitions.transitions[userId][index]['value'],
                        type: _transitions.transitions[userId][index]['type']);
                  },
                ),
              ),
            ],
          ), // Column
          //],
        ), // ListView
      ),
    ); //Scaffold
  }

  Widget creditCard({name, value}) {
    //bool desabilited = (userId == id) ? false : true;
    return Container(
      height: 210,
      child: AspectRatio(
        aspectRatio: 3.1 / 2,
        child: GestureDetector(
          onTap: () {
            setState(() {
              //userId = id;
            });
          },
          child: Container(
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Colors.blue,
//               border: desabilited
//                   ? null
//                   : Border.all(width: 4, color: Colors.green),
               borderRadius: BorderRadius.circular(20),
             ),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(.8),
                              shape: BoxShape.circle,
                            ),
                          ), // Container
                          Transform.translate(
                            offset: Offset(-15, 0),
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.orange.withOpacity(.8),
                                shape: BoxShape.circle,
                              ),
                            ), // Container
                          ), // Transform
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${value}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            ' US',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ), // Row

                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ), // Text
                          SizedBox(height: 10),
                          FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              '1234 **** **** 1234',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  letterSpacing: 6),
                            ),
                          ), // FittedBox
                        ],
                      ),
                    ],
                  ),
                ],
              ), // Column
            ),
          ), // Container
        ), // GestureDetector
      ), // AspectRatio
    ); // Container
  }

  Widget transationsCard({description, value, type}) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.9),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                type == '+' ? Icons.arrow_upward : Icons.arrow_downward,
                color: type == '+' ? Colors.green : Colors.red,
              ),
              SizedBox(width: 10),
              Text(
                description,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ), // Row
          Row(
            children: [
              Text(
                '${type}${value}',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                ' US',
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
        ],
      ), // Row
    ); // Container
  }
}

class AddCardPage extends StatefulWidget {
  @override
  AddCardPageState createState() => AddCardPageState();
}

class AddCardPageState extends State {
  
  CardController _controller = CardController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Add Card'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ), // AppBar
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              CustomTextField(hintText: 'Card Name', onChanged: _controller.setCardName),
              CustomTextField(hintText: 'Card Number', onChanged: _controller.setCardNumber),
//               CustomTextField(hintText: 'Bank Name', onChanged: ),
//               CustomTextField(hintText: 'Avaliable Balance'),
              CustomTextField(hintText: 'Currency', onChanged: _controller.setCurrency),

              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: MaterialButton(
                  minWidth: double.infinity,
                  onPressed: () {
                    
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PersonController {
  List cards = [{
    'cardName': 'Johnny vitor',
    'cardNumber': '1234 **** **** 1234',
    'currency': '1000'
  }];
  List transitions = [
    [
      {'description': 'Shopping', 'value': 150, 'type': '-'},
      {'description': 'Pix', 'value': 500, 'type': '+'},
      {'description': 'Burguer', 'value': 50, 'type': '-'},
      {'description': 'Salary', 'value': 1500, 'type': '+'}
    ],
    [
      {'description': 'Make', 'value': 150, 'type': '-'},
      {'description': 'Salary', 'value': 500, 'type': '+'},
      {'description': 'Pizza', 'value': 50, 'type': '-'},
      {'description': 'PetShop', 'value': 1500, 'type': '+'}
    ],
    [
      {'description': 'Bike', 'value': 150, 'type': '-'},
      {'description': 'Salary', 'value': 500, 'type': '+'},
      {'description': 'Sorvet', 'value': 50, 'type': '-'},
      {'description': 'Place', 'value': 1500, 'type': '+'}
    ],
  ];
  
  void cardAdd(String cardName, String cardNumber, String currency) {
    cards.add({'cardName': cardName,'cardNumber': cardNumber,'currency': currency});
  }
  
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Function(String) onChanged;
  CustomTextField({
    required this.hintText,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black),
          border: InputBorder.none,
        ),
       ),
    ); // Container
  }
}

class CardController {
  String _cardName = '';
  setCardName(cardName) => {_cardName = cardName};
  String _cardNumber = '';
  setCardNumber(cardNumber) => {_cardNumber = cardNumber};
  String _banckName = '';
  String _avaliableBalance = '';
  String _currency = '';
  setCurrency(currency) => {_currency = currency};
}
