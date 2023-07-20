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
        //color: Colors.blueGrey,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.only(top: 100, left: 40, right: 40),
          child: Column(children: [
            Container(
                width: 150,
                height: 150,
                child: Image.network(
                    'https://lh3.googleusercontent.com/mUuQy1PsIC2Mq1_ZGlUYP2pgY65qmMuNop5Ts1aKbWyMxNSrI8AEBdE-u26nnDDaAek')),
            SizedBox(height: 40),
            Row(children: [
              Expanded(
                child: CustomDropdown(
                  onChanged: (value) {
                    setState(() {_controller.setToCoin(value);});
                  },
                  itemSelected: _controller._toCoin,
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: TextField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    setState(() {_controller.setvalueCoin(value);});
                  },
                ),
              ),
            ]),
            Row(children: [
              Expanded(
                flex: 1,
                child: CustomDropdown(onChanged: _controller.setFromCoin,  itemSelected: _controller._fromCoin),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
                    child: Center(
                        child: Text('${_controller._valueConvert}',
                            style: TextStyle(fontWeight: FontWeight.bold)))),
              ),
            ]),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                
                if (_controller._toCoin != '' && _controller._fromCoin != '') {
                  setState(() {_controller.convert();});
                } else {
                  print('Preencha os campos vazios');
                }
              },
              child: Text('CONVERTER'),
            ),
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

class CurrencyController {
  String? _toCoin = 'real';
  setToCoin(String? toCoin) => {_toCoin = toCoin};

  String? _fromCoin = 'real';
  setFromCoin(String? fromCoin) => {_fromCoin = fromCoin};

  double _valueCoin = 0.0;
  setvalueCoin(String valueCoin) => {_valueCoin = double.parse(valueCoin)};

  double _valueConvert = 0;

  CurrencyModel currencyModel = CurrencyModel();

  void convert() {
    _valueConvert = _valueCoin * currencyModel.moedas[_toCoin][_fromCoin];
  }
}

class CustomDropdown extends StatelessWidget {
  final String? itemSelected;
  final Function(String?) onChanged;
  CustomDropdown({required this.onChanged, required this.itemSelected});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: DropdownButton(
        value: itemSelected,
        isExpanded: true,
        items: [
          DropdownMenuItem<String>(value: 'real', child: Text('Real')),
          DropdownMenuItem<String>(value: 'dolar', child: Text('Dolar')),
          DropdownMenuItem<String>(value: 'euro', child: Text('Euro')),
          DropdownMenuItem<String>(value: 'biticoin', child: Text('biticoin')),
        ],
        onChanged: onChanged,
      ),
    );
  }
}
