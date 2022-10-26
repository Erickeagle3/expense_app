// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:expense_app/data/trans.dart';
import 'package:intl/intl.dart';

class MyTransactions extends StatelessWidget {
  final List<Trans> Transaction;
  final Function removetrans;
  const MyTransactions(this.Transaction, this.removetrans, {super.key});

  @override
  Widget build(BuildContext context) {
    return Transaction.isEmpty
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
                height: 150,
                width: 150,
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
                margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
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
                    style:
                        const TextStyle(fontFamily: 'ComicNeue', fontSize: 20),
                  ),
                  subtitle: Text(
                      DateFormat.yMMMEd().format(Transaction[index].date),
                      style: const TextStyle(
                          fontFamily: 'ComicNeue',
                          fontWeight: FontWeight.bold)),
                  trailing: MediaQuery.of(context).size.width > 360
                      ? TextButton.icon(
                          icon:  Icon(Icons.delete_outline_rounded, color: Colors.red.shade900,),
                          label: Text(
                            'Delete',
                            style: TextStyle(color: Colors.red.shade900),
                          ),
                          onPressed: () => removetrans(Transaction[index].id))
                      : IconButton(
                          onPressed: () => removetrans(Transaction[index].id),
                          icon: Icon(
                            Icons.delete_outline_rounded,
                            color: Colors.red.shade900,
                          ),
                        ),
                ),
              );
            },
            itemCount: Transaction.length,
          );
  }
}
