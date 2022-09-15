import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: const Text('Expenses Calculator'),
            titleTextStyle: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            centerTitle: true,
            toolbarOpacity: 0.9,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35))),
            backgroundColor: Colors.red.shade300),
        body: Column(
          children: const <Widget>[
            Card(
              child: Text('chart overview'),
            ),
            Card(
              child: Text('list of expenses'),
            )
          ],
        ),
      ),
    );
  }
}
