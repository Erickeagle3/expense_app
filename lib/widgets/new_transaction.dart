// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function adduserinput;

  const NewTransaction(this.adduserinput, {super.key});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleInput = TextEditingController();
  final _amountInput = TextEditingController();
  DateTime? _selectedDate;

  void _submiteinfo() {
    if (_amountInput.text.isEmpty) {
      return;
    }

    final enteredInfo = _titleInput.text;
    final enteredAmount = double.parse(_amountInput.text);
    if (enteredInfo.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.adduserinput(enteredInfo, enteredAmount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _datepicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((datePicked) {
      if (datePicked == null) {
        return;
      }
      setState(() {
        _selectedDate = datePicked;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                controller: _titleInput,
                keyboardType: TextInputType.name,
                onSubmitted: (value) => _submiteinfo(),
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Amount'),
                controller: _amountInput,
                keyboardType: TextInputType.number,
                onSubmitted: (value) => _submiteinfo(),
              ),
              SizedBox(
                height: 50,
                child: Row(
                  children: <Widget>[
                    Text(
                      _selectedDate == null
                          ? 'No Date Chosen'
                          : '''Selected Date: 
${DateFormat.yMd().format(_selectedDate as DateTime)}''',
                      style: const TextStyle(
                          fontFamily: 'ComicNeue',
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 195),
                      child: TextButton(
                        onPressed: _datepicker,
                        child: const Text(
                          'Pick Date',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.lightGreen),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 270),
                child: ElevatedButton(
                    onPressed: _submiteinfo,
                    child: Text(
                      'Add Spents',
                      selectionColor: Theme.of(context).primaryColor,
                      style: const TextStyle(color: Colors.black),
                    )),
              ),
            ],
          ),
        ));
  }
}
