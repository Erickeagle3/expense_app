import 'package:expense_app/widgets/chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expense_app/data/trans.dart';
import 'package:expense_app/widgets/new_transaction.dart';
import 'package:expense_app/widgets/newstylet.dart';
//import 'package:flutter/services.dart';
//import 'package:expense_app/widgets/transaction.dart';

void main() {
  /*  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]); */
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses Calculator',
      theme: ThemeData(
          primarySwatch: Colors.lightGreen,
          fontFamily: 'ComicNeue',
          textTheme: ThemeData.light().textTheme.copyWith(
              subtitle1: const TextStyle(
                  fontFamily: 'ComicNeue',
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
              button: const TextStyle(color: Colors.black))),
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
    /*  Trans(
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
    ), */
  ];

  bool _showOverview = true;

  List<Trans> get _recentTransactions {
    return _userTransaction.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  // ignore: non_constant_identifier_names
  void _UserInput(String textTitle, double textAmount, DateTime settedDate) {
    final newtext = Trans(
      title: textTitle,
      amount: textAmount,
      date: settedDate,
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

  void _removeTransaction(String id) {
    setState(() {
      _userTransaction.removeWhere((rtrans) => rtrans.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      title: Text(
        'Expenses Calculator',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      titleTextStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
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
    );
    return MaterialApp(
      home: Scaffold(
        appBar: appbar,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Show Expenses Overview',
                        style: TextStyle(
                            fontFamily: 'ComicNeue',
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      Switch(
                        value: _showOverview,
                        onChanged: (value) {
                          setState(() {
                            _showOverview = value;
                          });
                        },
                        activeColor: Colors.lightGreen,
                      ),
                    ],
                  ),
                  Container(
                      height: (MediaQuery.of(context).size.height -
                              appbar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.2,
                      child: MyChart(_recentTransactions)),
                  Container(
                      height: (MediaQuery.of(context).size.height -
                              appbar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.8,
                      child:
                          MyTransactions(_userTransaction, _removeTransaction)),
                ],
              ),
            ],
          ),
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
