import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function adduserinput;
  final titleInput = TextEditingController();
  final amountInput = TextEditingController();

  NewTransaction(this.adduserinput, {super.key});

  void submiteinfo() {
    final enteredInfo = titleInput.text;
    final enteredAmount = double.parse(amountInput.text);
    if (enteredInfo.isEmpty || enteredAmount <= 0) {
      return;
    }
    adduserinput(enteredInfo, enteredAmount);
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
                controller: titleInput,
                keyboardType: TextInputType.name,
                onSubmitted: (value) => submiteinfo(),
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Amount'),
                controller: amountInput,
                keyboardType: TextInputType.number,
                onSubmitted: (value) => submiteinfo(),
              ),
              TextButton(
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all(Colors.cyan.shade300)),
                  onPressed: submiteinfo,
                  child: const Text(
                    'Add Spents',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ))
            ],
          ),
        ));
  }
}
