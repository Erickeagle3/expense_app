import 'package:flutter/material.dart';
import 'package:expense_app/widgets/user_transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          backgroundColor: Colors.red.shade300,
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add_circle_outline,
              ),
            )
          ],
        ),
        body: ListView(
          children: const <Widget>[
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 5,
                child: Text(
                  'expenses overview',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            UserTransaction(),
          ],
        ),
        //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    );
  }
}
