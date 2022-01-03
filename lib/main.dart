import 'package:flutter/material.dart';

import './widgets/new_transaction.dart';
import './models/transactions.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';

//! main method
void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
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
  //! scroll view controller
  // final _scrollController = ScrollController();

  //! All transactions list.
  final List<Transactions> _userTransactions = [
    Transactions(
      id: "t1",
      title: "Shirt",
      amount: 1500,
      date: DateTime(2021, 12, 26),
    ),
    Transactions(
      id: "t2",
      title: "Jeans",
      amount: 1500,
      date: DateTime(2021, 12, 27),
    ),
    Transactions(
      id: "t3",
      title: "Shoes",
      amount: 2500,
      date: DateTime(2021, 12, 28),
    ),
    Transactions(
      id: "t4",
      title: "Wrist Watch",
      amount: 2000,
      date: DateTime(2021, 12, 29),
    ),
    Transactions(
      id: "t5",
      title: "Jersy",
      amount: 2000,
      date: DateTime(2021, 12, 29),
    ),
    Transactions(
      id: "t6",
      title: "Jacket",
      amount: 3000,
      date: DateTime(2021, 12, 30),
    ),
    Transactions(
      id: "t7",
      title: "Cap",
      amount: 500,
      date: DateTime(2021, 12, 31),
    ),
    Transactions(
      id: "t7",
      title: "Cap",
      amount: 500,
      date: DateTime(2021, 12, 31),
    ),
    Transactions(
      id: "t7",
      title: "Cap",
      amount: 500,
      date: DateTime(2021, 12, 31),
    ),
    Transactions(
      id: "t7",
      title: "Cap",
      amount: 500,
      date: DateTime(2021, 12, 31),
    ),
    Transactions(
      id: "t7",
      title: "Cap",
      amount: 500,
      date: DateTime(2021, 12, 31),
    ),
  ];

  bool _showChartswitch = false;

  //! 7 days transaction getter
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

  //! add new transaction method.
  void _addNewTransaction(String title, double amount, DateTime choosedDate) {
    final tx = Transactions(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: choosedDate,
    );

    setState(() {
      _userTransactions.insert(0, tx);
    });
  }

  //! Delete a transaction method.
  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((element) => element.id == id);
    });
  }

  //! Add Transaction modal
  void _startAddTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(_addNewTransaction);
      },
    );
  }

  // //! Scroll to top method
  // void _scrollToTop() {
  //   _scrollController.animateTo(
  //     0,
  //     duration: const Duration(
  //       milliseconds: 300,
  //     ),
  //     curve: Curves.decelerate,
  //   );
  // }

  //! ================ build method ======================
  @override
  Widget build(BuildContext context) {
    final inLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    //! App bar
    final appBar = AppBar(
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
    );

    return Scaffold(
      backgroundColor: const Color(0xFFe6e6e6),

      appBar: appBar,
      //! body
      body: SingleChildScrollView(
        // controller: _scrollController,
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          child: Column(
            //! Main Column
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //! ========== Landscape Mode ============
              //! Switch.
              if (inLandscape)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Show Chart",
                    ),
                    Switch(
                      value: _showChartswitch,
                      onChanged: (val) {
                        _showChartswitch = val;
                        setState(() {});
                      },
                    ),
                  ],
                ),
              //! Weeks
              if (inLandscape)
                _showChartswitch
                    ? Container(
                        width: double.infinity,
                        height: (MediaQuery.of(context).size.height -
                                MediaQuery.of(context).padding.top -
                                appBar.preferredSize.height) *
                            0.75,
                        child: Chart(_recentTransactions),
                      )
                    :
                    //! All Transactions:
                    Container(
                        height: (MediaQuery.of(context).size.height -
                                MediaQuery.of(context).padding.top -
                                appBar.preferredSize.height) *
                            0.75,
                        width: double.infinity,
                        child: TransactionList(
                            _userTransactions, _deleteTransaction),
                      ),

              //! ======== Portrait mode =======
              if (!inLandscape)
                Container(
                  width: double.infinity,
                  height: (MediaQuery.of(context).size.height -
                          MediaQuery.of(context).padding.top -
                          appBar.preferredSize.height) *
                      0.3,
                  child: Chart(_recentTransactions),
                ),
              if (!inLandscape)
                Container(
                  height: (MediaQuery.of(context).size.height -
                          MediaQuery.of(context).padding.top -
                          appBar.preferredSize.height) *
                      0.7,
                  width: double.infinity,
                  child: TransactionList(_userTransactions, _deleteTransaction),
                ),
            ],
          ),
        ),
      ),
      //! Back to top button.
      floatingActionButton: FloatingActionButton.small(
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
        onPressed: () => _startAddTransaction(context),

        // backgroundColor: const Color(0xFF435454),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
