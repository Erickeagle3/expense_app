import 'dart:math';

import 'package:flutter/material.dart';
import 'trans.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<Trans> trans = [
    Trans(
      id: 'Erick',
      title: 'HeadSet',
      amount: 1000,
      date: DateTime.now(),
    ),
    Trans(
      id: 'Kevin',
      title: 'Cable',
      amount: 900,
      date: DateTime.now(),
    ),
  ];

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
          children: <Widget>[
            const SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 5,
                child: Text(
                  'expenses overview',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Column(
              children: trans.map((exp) {
                return Card(
                    child: Row(
                  children: <Widget>[
                    // ignore: avoid_unnecessary_containers
                    Container(
                      child: Text(exp.amount.toString()),
                    ),
                    Column(
                      children: <Widget>[
                        Text(exp.title),
                        Text(exp.date.toString()),
                      ],
                    )
                  ],
                ));
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
