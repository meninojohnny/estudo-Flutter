import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State {
  
  CurrencyController _controller = CurrencyController();
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.only(top: 100, left: 40, right: 40),
          child: Column(children: [
            Container(color: Colors.blue, width: 100, height: 100),
            SizedBox(height: 40),
            CurrencyBox(
              onChanged: (value) {_controller.setToCoin(value ?? '');},
              onChangedValue: (value) {_controller.setvalueCoin(value ?? '');},
            ),
            SizedBox(height: 30),
            CurrencyBox(
              onChanged: (value) {_controller.setFromCoin(value ?? '');},
              onChangedValue: (value) {_controller.setvalueCoin2(value ?? '');},
            ),
            SizedBox(height:20),
            ElevatedButton(
              onPressed: () {
                setState(() {_controller.convert();});
                //_controller._valueCoin = 0;
              },
              child: Text('CONVERTER'),
            ),
            SizedBox(height:20),
            Container(
              child: Text(
                '${_controller._valueCoin}',
                style: TextStyle(fontSize: 30),
              )),
          ]),
        ),
      ),
    );
  }
}

class CurrencyModel {
  Map moedas = {
    'real': {'real': 1.0, 'dolar': 0.18, 'euro': 0.15, 'biticoin': 0.000016},
    'dolar': {'real': 5.65, 'dolar': 1.0, 'euro': 0.85, 'biticoin': 0.000088},
    'euro': {'real': 6.62, 'dolar': 1.17, 'euro': 1.0, 'biticoin': 0.00010},
    'biticoin': {
      'real': 64116.51,
      'dolar': 11351030,
      'euro': 9689.54,
      'biticoin': 1
    }
  };
}

class CurrencyBox extends StatelessWidget {
  
  final Function(String?) onChanged;
  final Function(String?) onChangedValue;
  
  CurrencyBox({Key? key, required this.onChanged, required this.onChangedValue});
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 64,
            child: DropdownButton(
              isExpanded: true,
              items: [
                DropdownMenuItem<String>(value: 'real', child: Text('Real')),
                DropdownMenuItem<String>(value: 'dolar', child: Text('Dolar')),
                DropdownMenuItem<String>(value: 'euro', child: Text('Euro')),
                DropdownMenuItem<String>(
                    value: 'biticoin', child: Text('biticoin')),
              ],
              onChanged: onChanged,
            ),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          flex: 2,
          child: TextField(
            onChanged: onChangedValue,
            decoration: InputDecoration(),
          ),
        ),
      ]),
    );
  }
}

class CurrencyController {
  String _toCoin = '';
  setToCoin(String toCoin) => {_toCoin = toCoin};
  String _fromCoin = '';
  setFromCoin(String fromCoin) => {_fromCoin = fromCoin};
  double _valueCoin = 0.0;
  setvalueCoin(String valueCoin) => {_valueCoin = double.parse(valueCoin)};
  double _valueCoin2 = 0.0;
  setvalueCoin2(String valueCoin2) => {_valueCoin2 = double.parse(valueCoin2)};
  
  
  CurrencyModel currencyModel = CurrencyModel();
  
  void convert() {
    _valueCoin *= currencyModel.moedas[_toCoin][_fromCoin];
  }
  
  
}
