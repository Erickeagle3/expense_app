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
      height: 750, //changing acording to testing device for now.
      child: ListView.builder(
        itemBuilder: (text, index) {
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
                  '₹ ${Transaction[index].amount.toStringAsFixed(2)}',
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
                    Transaction[index].title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    DateFormat().format(Transaction[index].date),
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              )
            ],
          ));
        },
        itemCount: Transaction.length,
      ),
    );
  }
}
