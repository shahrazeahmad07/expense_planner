import 'package:flutter/material.dart';

import '../models/transactions.dart';
import './transaction_list.dart';
import './new_transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transactions> _userTransactions = [
    Transactions(
        id: "t1", title: "New Shoes", amount: 1500, date: DateTime.now()),
    Transactions(id: "t2", title: "Jacket", amount: 3000, date: DateTime.now()),
  ];

  void _addNewTransaction(String title, double amount) {
    final tx = Transactions(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(tx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //! Add Transaction Section:
        NewTransaction(_addNewTransaction),
        //! Transactions.
        TransactionList(_userTransactions),
      ],
    );
  }
}
