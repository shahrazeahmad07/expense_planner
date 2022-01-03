import 'package:flutter/material.dart';

class ChartBars extends StatelessWidget {
  final String weekday;
  final double spendingAmount;
  final double spendingPctOfTotal;

  ChartBars(this.weekday, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: [
            SizedBox(
              height: constraints.maxHeight * 0.03,
            ),
            //! Price Text.
            Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                child: Text(
                  spendingAmount.toStringAsFixed(0),
                  // style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.02,
            ),
            //! Bars
            Container(
              height: constraints.maxHeight * 0.60,
              width: 10,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        // color: Theme.of(context).primaryColor,
                        color: const Color(0xFF2d3940),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingPctOfTotal,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        border: Border.all(
                          color: const Color(0xFF2d3940),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.02,
            ),
            //! Weekday label
            Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                child: Text(
                  weekday,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
