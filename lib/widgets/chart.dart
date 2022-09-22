import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expense_app/data/trans.dart';
import 'chart_box.dart';

class MyChart extends StatelessWidget {
  final List<Trans> recentTransactions;

   const MyChart(this.recentTransactions, {super.key});

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      // ignore: avoid_print
      print(DateFormat.E().format(weekDay));
      // ignore: avoid_print
      print(totalSum);
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + (item['amount'] as num);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      margin: const EdgeInsets.all(10),
      child: Row(
        children: groupedTransactionValues.map((view) {
          return MyChartBox(
            view['day'] as String,
            view['amount'] as double,
            totalSpending == 0.0
             ? 0.0 : (view['amount'] as double) / totalSpending,
          );
        }).toList(),
      ),
    );
  }
}
