import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function adduserinput;
  final titleInput = TextEditingController();
  final amountInput = TextEditingController();

  NewTransaction(this.adduserinput, {super.key});

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
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Amount'),
                controller: amountInput,
              ),
              TextButton(
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all(Colors.cyan.shade300)),
                  onPressed: () {
                    adduserinput(
                        titleInput.text, double.parse(amountInput.text));
                  },
                  child: const Text(
                    'Add Spends',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ))
            ],
          ),
        ));
  }
}
