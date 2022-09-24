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
      child: Transaction.isEmpty
          ? Column(
              children: <Widget>[
                const Text(
                  'No Trsansaction\'s added yet',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, fontFamily: 'ComicNeue'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                  'assets/images/no_edited.jpg',
                  height: 200,
                  width: 200,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '''In order to add Transaction
please click any of the add button''',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, fontFamily: 'ComicNeue'),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (text, index) {
                return Card(
                  elevation: 6,
                  margin:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.lightGreen,
                      radius: 35,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(
                            child: Text(
                          '₹ ${Transaction[index].amount.toStringAsFixed(2)}',
                          style: const TextStyle(
                              color: Colors.black, fontFamily: 'ComicNeue'),
                        )),
                      ),
                    ),
                    title: Text(
                      Transaction[index].title,
                      style: const TextStyle(
                          fontFamily: 'ComicNeue', fontSize: 20),
                    ),
                    subtitle: Text(
                        DateFormat.yMMMEd().format(Transaction[index].date),
                        style: const TextStyle(fontFamily: 'ComicNeue', fontWeight: FontWeight.bold)),
                  ),
                );
              },
              itemCount: Transaction.length,
            ),
    );
  }
}
