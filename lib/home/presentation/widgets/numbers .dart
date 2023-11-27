import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NumberDisplayApp(),
    );
  }
}

class NumberDisplayApp extends StatefulWidget {
  @override
  _NumberDisplayAppState createState() => _NumberDisplayAppState();
}

class _NumberDisplayAppState extends State<NumberDisplayApp> {
  int selectedNumber = 0;

  void updateTextField(int number) {
    setState(() {
      selectedNumber = number;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button Number Display'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Selected Number:',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '$selectedNumber',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(5, (index) {
                    final number = index + 1;
                    return ElevatedButton(
                      onPressed: () {
                        updateTextField(number);
                      },
                      child: Text('$number'),
                    );
                  }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (index) {
                    final number = index + 6; // Start from 6 for the second row
                    return ElevatedButton(
                      onPressed: () {
                        updateTextField(number);
                      },
                      child: Text('$number'),
                    );
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
