import 'package:flutter/material.dart';

import './widgets/new_transaction.dart';
import './models/transactions.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';

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
      title: 'Expense Planner',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 22,
          ),
          bodyText2: TextStyle(
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            // fontWeight: FontWeight.bold,
            fontSize: 19,
            color: Colors.white,
          ),
        ),
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

  List<Transactions> get _recentTransactions {
    return _userTransactions.where((element) {
      return element.date.isAfter(
        DateTime.now().subtract(
          const Duration(
            days: 7,
          ),
        ),
      );
    }).toList();
  }

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
      backgroundColor: const Color(0xFFe6e6e6),
      //! App bar
      appBar: AppBar(
        // backgroundColor: const Color(0xFF435454),
        title: const Text(
          "Expense Planner",
        ),
        actions: [
          //! Add Transaction Button.
          IconButton(
            onPressed: () => _startAddTransaction(context),
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
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
              Chart(_recentTransactions),
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
        // backgroundColor: const Color(0xFF435454),
      ),
    );
  }
}
