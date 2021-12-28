import 'package:flutter/material.dart';

import './widgets/user_transactions.dart';

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
class MyHomePage extends StatelessWidget {
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
            onPressed: () {},
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
              UserTransactions(),
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
