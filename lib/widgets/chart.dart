import 'package:flutter/material.dart';

import '../models/transactions.dart';

class Chart extends StatelessWidget {
  final List<Transactions> recentTransactions;

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      return {'Day': 'M', 'Amount': 99};
    });
  }

  Chart(this.recentTransactions);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Row(
        children: [],
      ),
    );
  }
}
