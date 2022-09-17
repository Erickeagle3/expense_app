// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:expense_app/data/trans.dart';
import 'package:intl/intl.dart';

class MyTransactions extends StatelessWidget {
  final List<Trans> Transaction;
  const MyTransactions(this.Transaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 800,
      child: SingleChildScrollView(
        child: Column(
          children: Transaction.map((exp) {
            return Card(
                child: Row(
              children: <Widget>[
                // ignore: avoid_unnecessary_containers
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
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
        ),
      ),
    );
  }
}
