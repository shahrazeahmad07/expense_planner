import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/chartbars.dart';
import '../models/transactions.dart';

class Chart extends StatelessWidget {
  final List<Transactions> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));

      double totalSum = 0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekday.day &&
            recentTransactions[i].date.year == weekday.year &&
            recentTransactions[i].date.month == weekday.month) {
          totalSum += recentTransactions[i].amount;
        }
      }

      return {
        'Day': DateFormat.E().format(weekday).substring(0, 1),
        'Amount': totalSum
      };
    }).reversed.toList();
  }

  double get totalSpendingOfAllWeek {
    return groupedTransactionValues.fold(
      0.0,
      (previousValue, element) {
        return previousValue + (element['Amount'] as double);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.fromLTRB(4.5, 12.5, 4.5, 10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...groupedTransactionValues.map((e) {
              //! bars
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBars(
                    (e['Day'] as String),
                    (e['Amount'] as double),
                    totalSpendingOfAllWeek == 0
                        ? 0
                        : (e['Amount'] as double) / totalSpendingOfAllWeek),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
