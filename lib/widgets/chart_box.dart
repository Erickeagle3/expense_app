import 'package:flutter/material.dart';

class MyChartBox extends StatelessWidget {
  final String leb;
  final double spentAmount;
  final double spentperofTotal;

  const MyChartBox(this.leb, this.spentAmount, this.spentperofTotal,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('₹ ${spentAmount.toStringAsFixed(0)}'),
        const SizedBox(
          height: 4,
        ),
        // ignore: sized_box_for_whitespace
        Container(
          height: 60,
          width: 10,
          child: Stack(children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1.0),
                color: Colors.red.shade300,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            FractionallySizedBox(
              heightFactor: spentperofTotal,
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(15)),
              ),
            )
          ]),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(leb),
      ],
    );
  }
}
