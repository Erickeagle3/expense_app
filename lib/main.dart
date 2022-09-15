import 'package:flutter/material.dart';
import 'trans.dart';
import 'package:intl/intl.dart';

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
            Card(
                elevation: 10,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: const <Widget>[
                      TextField(
                        decoration: InputDecoration(labelText: 'Title'),
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: 'Amount'),
                      ),
                    ],
                  ),
                )),
            Column(
              children: trans.map((exp) {
                return Card(
                    child: Row(
                  children: <Widget>[
                    // ignore: avoid_unnecessary_containers
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 14),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.cyan, width: 4)),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        '₹ ${exp.amount}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.cyan),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // ignore: prefer_const_constructors
                        Text(
                          exp.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          DateFormat().format(exp.date),
                          style: const TextStyle(fontSize: 16),
                        ),
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
