import 'package:flutter/material.dart';
import 'package:expense_app/data/trans.dart';
import 'package:expense_app/widgets/new_transaction.dart';
import 'package:expense_app/widgets/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses Calculator',
      theme: ThemeData(
        primaryColor: Colors.amberAccent,
        fontFamily: 'ComicNeue',
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Trans> _userTransaction = [
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

  // ignore: non_constant_identifier_names
  void _UserInput(String textTitle, double textAmount) {
    final newtext = Trans(
      title: textTitle,
      amount: textAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    setState(() {
      _userTransaction.add(newtext);
    });
  }

  void _startNewTransaction(BuildContext test) {
    showModalBottomSheet(
      context: test,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          // ignore: sort_child_properties_last
          child: NewTransaction(_UserInput),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Expenses Calculator', style: Theme.of(context).textTheme.titleLarge,),
          titleTextStyle: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black, ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only( 
            bottomLeft: Radius.elliptical(20, 20),
            bottomRight: Radius.elliptical(20, 20),
          )),
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              onPressed: () => _startNewTransaction(context),
              icon: const Icon(
                Icons.add_circle_outline,
              ),
            )
          ],
        ),
        body: ListView(
          children: <Widget>[
             SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 5,
                child: Text(
                  'expenses overview',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            MyTransactions(_userTransaction),
          ],
        ),
        //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () => _startNewTransaction(context),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
