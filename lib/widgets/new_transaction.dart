import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function adduserinput;

  const NewTransaction(this.adduserinput, {super.key});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleInput = TextEditingController();
  final _amountInput = TextEditingController();

  void _submiteinfo() {
    final enteredInfo = _titleInput.text;
    final enteredAmount = double.parse(_amountInput.text);
    if (enteredInfo.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.adduserinput(enteredInfo, enteredAmount);
    Navigator.of(context).pop();
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
                    Text('No Date Chosen'),
                    Container(
                      margin: const EdgeInsets.only(left: 285),
                      child: TextButton(
                        onPressed: () {},
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
                margin: const EdgeInsets.only(left: 350),
                child: Flexible(
                  child: ElevatedButton(
                      onPressed: _submiteinfo,
                      child: Text(
                        'Add Spents',
                        selectionColor: Theme.of(context).primaryColor,
                        style: const TextStyle(color: Colors.black),
                      )),
                ),
              )
            ],
          ),
        ));
  }
}
