import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyCustomForm());
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  String _convertedVar = "";
  TextEditingController _textController = TextEditingController();
  double _res = 0.0;

  void _convert() {
    // Change return type to void
    setState(() {
      double montant = double.tryParse(_textController.text) ?? 0;
      if (_convertedVar == "DinarToEuro") {
        _res = montant / 3.4;
      } else {
        _res = montant * 3.4;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TP1 App"),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _textController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Montant",
                ),
              ),
              RadioListTile(
                title: Text("Dinar -> Euro"),
                value: "DinarToEuro",
                groupValue: _convertedVar,
                onChanged: (value) {
                  setState(() {
                    _convertedVar = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: Text("Euro -> Dinar"),
                value: "EuroToDinar",
                groupValue: _convertedVar,
                onChanged: (value) {
                  setState(() {
                    _convertedVar = value.toString();
                  });
                },
              ),
              SizedBox(height: 20),
              Text(
                "Le résultat est ${_res.toStringAsFixed(3)}  ",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _convert,
                child: Text("CONVERTIR"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 206, 148, 216),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
