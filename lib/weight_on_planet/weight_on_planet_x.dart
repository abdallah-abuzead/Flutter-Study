import 'package:flutter/material.dart';

class WeightOnPlanetX extends StatefulWidget {
  @override
  _WeightOnPlanetXState createState() => _WeightOnPlanetXState();
}

class _WeightOnPlanetXState extends State<WeightOnPlanetX> {
  final TextEditingController _weightController = TextEditingController();
  int radioValue = 0;
  double _finalResult = 0.0;
  String _formattedText = '';

  void handleRadioValueChanged(value) {
    setState(
      () {
        radioValue = value;
        switch (radioValue) {
          case 0:
            _finalResult = calculateWeight(_weightController.text, 0.06);
            _formattedText = 'Your Weight on Pluto is: ${_finalResult.toStringAsFixed(1)}';
            break;
          case 1:
            _finalResult = calculateWeight(_weightController.text, 0.38);
            _formattedText = 'Your Weight on Mars is: ${_finalResult.toStringAsFixed(1)}';
            break;
          case 2:
            _finalResult = calculateWeight(_weightController.text, 0.91);
            _formattedText = 'Your Weight on Venus is: ${_finalResult.toStringAsFixed(1)}';
            break;
        }
      },
    );
  }

  double calculateWeight(String weight, double multiplier) {
    if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
      return int.parse(weight) * multiplier;
    } else
      return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: Text('Weight on Planet X'),
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: EdgeInsets.all(15),
          children: [
            Image.asset(
              'images/planet.png',
              height: 170,
              width: 230,
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Your Weight on Earth', hintText: 'in Pounds', icon: Icon(Icons.person_outline)),
                  ),
                  Padding(padding: EdgeInsets.all(15)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio<int>(
                        value: 0,
                        groupValue: radioValue,
                        onChanged: handleRadioValueChanged,
                        activeColor: Colors.brown,
                      ),
                      Text(
                        'Pluto',
                        style: TextStyle(color: Colors.white30),
                      ),
                      Radio<int>(
                        value: 1,
                        groupValue: radioValue,
                        onChanged: handleRadioValueChanged,
                        activeColor: Colors.red,
                      ),
                      Text(
                        'Mars',
                        style: TextStyle(color: Colors.white30),
                      ),
                      Radio<int>(
                        value: 2,
                        groupValue: radioValue,
                        onChanged: handleRadioValueChanged,
                        activeColor: Colors.orangeAccent,
                      ),
                      Text(
                        'Venus',
                        style: TextStyle(color: Colors.white30),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(16)),
                  Text(
                    _weightController.text.isEmpty ? 'Please enter weight' : _formattedText + ' lbs',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
