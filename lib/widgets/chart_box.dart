import 'package:flutter/material.dart';

class MyChartBox extends StatelessWidget {
  final String leb;
  final double spentAmount;
  final double spentperofTotal;

  const MyChartBox(this.leb, this.spentAmount, this.spentperofTotal,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
      builder: (p0, Constraints) {
        return Column(
          children: <Widget>[
            SizedBox(
                height: Constraints.maxHeight * 0.11,
                child: FittedBox(
                    child: Text('₹ ${spentAmount.toStringAsFixed(0)}'))),
            SizedBox(
              height: Constraints.maxHeight * 0.10,
            ),
            // ignore: sized_box_for_whitespace
            Container(
              height: Constraints.maxHeight * 0.6,
              width: 10,
              child: Stack(children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1.0),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: spentperofTotal,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                )
              ]),
            ),
            SizedBox(
              height: Constraints.maxHeight * 0.09,
            ),
            SizedBox(
                height: Constraints.maxHeight * 0.1,
                child: FittedBox(child: Text(leb))),
          ],
        );
      },
    );
  }
}
