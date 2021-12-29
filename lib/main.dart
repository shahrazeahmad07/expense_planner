import 'package:flutter/material.dart';

import './widgets/new_transaction.dart';
import './models/transactions.dart';
import './widgets/transaction_list.dart';

//! main method
void main() {
  runApp(MyApp());
}

//! Main my App Widget which will contain material app widget(root of widget tree)
///! and all other widgets..!
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

//! My homepage widget.
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  void _startAddTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(_addNewTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6EABE),
      //! App bar
      appBar: AppBar(
        backgroundColor: const Color(0xFF435454),
        title: const Text("Expense Planner"),
        actions: [
          //! Add Transaction Button.
          IconButton(
            onPressed: () => _startAddTransaction(context),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      //! body
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          child: Column(
            //! Main Column
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //! Weeks
              const Card(
                child: Text("Card 1"),
                elevation: 3,
              ),
              //! All Transactions:
              TransactionList(_userTransactions),
            ],
          ),
        ),
      ),
      //! Back to top button.
      floatingActionButton: FloatingActionButton(
        child: Image.asset('assets/icons/uparrow.png'),
        onPressed: () {},
        backgroundColor: const Color(0xFF435454),
      ),
    );
  }
}
