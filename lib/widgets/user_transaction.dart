import 'package:flutter/material.dart';
import 'package:expense_app/widgets/transaction.dart';
import 'package:expense_app/widgets/new_transaction.dart';
import 'package:expense_app/data/trans.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({super.key});

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Trans> _transaction = [
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

  void _UserInput(String textTitle, double textAmount) {
    final newtext = Trans(
      title: textTitle,
      amount: textAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    setState(() {
      _transaction.add(newtext);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_UserInput),
        MyTransactions(_transaction),
      ],
    );
  }
}
