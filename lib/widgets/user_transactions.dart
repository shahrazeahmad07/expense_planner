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
    Transactions(id: "t1", title: "Shirt", amount: 1500, date: DateTime.now()),
    Transactions(id: "t2", title: "Jeans", amount: 1500, date: DateTime.now()),
    Transactions(id: "t3", title: "Shoes", amount: 2500, date: DateTime.now()),
    Transactions(
        id: "t4", title: "Wrist Watch", amount: 2000, date: DateTime.now()),
    Transactions(id: "t5", title: "Jersy", amount: 2000, date: DateTime.now()),
    Transactions(id: "t6", title: "Jacket", amount: 3000, date: DateTime.now()),
    Transactions(id: "t7", title: "Cap", amount: 500, date: DateTime.now()),
  ];

  void _addNewTransaction(String title, double amount) {
    final tx = Transactions(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    setState(() {
      _userTransactions.insert(0, tx);
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
