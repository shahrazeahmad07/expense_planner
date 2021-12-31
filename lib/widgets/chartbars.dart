import 'package:flutter/material.dart';

class ChartBars extends StatelessWidget {
  final String weekday;
  final double spendingAmount;
  final double spendingPctOfTotal;

  ChartBars(this.weekday, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 4,
        ),
        //! Price Text.
        Text(
          spendingAmount.toStringAsFixed(0),
        ),
        const SizedBox(
          height: 2,
        ),
        //! Bars
        Container(
          height: 60,
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
        const SizedBox(
          height: 2,
        ),
        //! Weekday label
        Text(
          weekday,
        ),
        const SizedBox(
          height: 4,
        ),
      ],
    );
  }
}
