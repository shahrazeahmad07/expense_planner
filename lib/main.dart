import 'package:expense_planner/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  final List<Transactions> transactions = [
    Transactions(
        id: "t1", title: "New Shoes", amount: 1500, date: DateTime.now()),
    Transactions(id: "t2", title: "Jacket", amount: 3000, date: DateTime.now()),
  ];
  //? variables used for manual method of saving data
  // late String inputTitle;
  // late String inputAmount;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6EABE),
      appBar: AppBar(
        backgroundColor: const Color(0xFF6f8b8b),
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
                    TextField(
                      decoration: const InputDecoration(
                        labelText: "Title",
                      ),
                      //? manual method of saving data.
                      // onChanged: (val) {
                      //   inputTitle = val;
                      // },
                      //? automatic method
                      controller: titleController,
                    ),
                    //! Add Transaction Amount
                    TextField(
                      decoration: const InputDecoration(
                        labelText: "Amount",
                      ),
                      //? manual method of saving data.
                      // onChanged: (val) {
                      //   inputAmount = val;
                      // },
                      //? automatic method
                      controller: amountController,
                    ),
                    //! Add Transaction Button.
                    Container(
                      alignment: Alignment.bottomRight,
                      margin: const EdgeInsets.only(top: 6),
                      child: ElevatedButton(
                        onPressed: () {
                          print(titleController.text);
                          print(amountController.text);
                        },
                        child: const Text(
                          "Add Transaction",
                          style: TextStyle(
                            fontSize: 18,
                            // fontWeight: FontWeight.bold,
                            // letterSpacing: 1,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xFF87AAAA)),
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
