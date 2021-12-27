import 'package:expense_planner/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

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

class MyHomePage extends StatelessWidget {
  final List<Transactions> transactions = [
    Transactions(
        id: "t1", title: "New Shoes", amount: 1500, date: DateTime.now()),
    Transactions(id: "t2", title: "Jacket", amount: 3000, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6EABE),
      appBar: AppBar(
        backgroundColor: const Color(0xFF87AAAA),
        title: const Text("Expense Planner"),
      ),
      body: Container(
        //! Body of App.
        margin: const EdgeInsets.symmetric(
          horizontal: 5,
        ),
        child: Column(
          //! Main Column
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //! Weeks
            const Card(
              child: Text("Card 1"),
              elevation: 3,
            ),
            //! Add Transaction Section:
            Card(
              elevation: 3,
              child: Container(
                padding: const EdgeInsets.fromLTRB(15, 1, 15, 7),
                child: Column(
                  children: [
                    //! Add transaction Title.
                    const TextField(
                      decoration: InputDecoration(
                        labelText: "Title",
                      ),
                    ),
                    //! Add Transaction Amount
                    const TextField(
                      decoration: InputDecoration(
                        labelText: "Amount",
                      ),
                    ),
                    //! Add Transaction Button.
                    Container(
                      alignment: Alignment.bottomRight,
                      margin: const EdgeInsets.only(top: 6),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text("Add Transaction"),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xFF865439)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //! Transactions.
            Column(
              children: transactions.map((e) {
                //! Transaction Card.
                return Card(
                  elevation: 3,
                  child: Row(
                    children: [
                      //! Price Box.
                      Container(
                        margin: const EdgeInsets.fromLTRB(17, 10, 15, 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF865439),
                            width: 1,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 11,
                          vertical: 13,
                        ),
                        //! Price Value
                        child: Text(
                          e.amount.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                            color: Color(0xFF865439),
                          ),
                        ),
                      ),
                      //! Transaction Title and Date.
                      Container(
                        margin: const EdgeInsets.only(top: 3),
                        height: 45,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            //! Title.
                            Text(
                              e.title,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF865439),
                              ),
                            ),
                            //! Date.
                            Text(
                              DateFormat.yMMMd().format(e.date),
                              style: const TextStyle(
                                color: Color(0xFF87AAAA),
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
