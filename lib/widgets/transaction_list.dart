import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transactions.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> _userTransactions;
  Function(String) deleteTransaction;

  TransactionList(this._userTransactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return _userTransactions.isEmpty
        ? Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                height: 210,
                child: Image.asset(
                  'assets/images/waiting.png',
                ),
              ),
              Text(
                "No Transactions Added yet...",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          )
        : Column(
            children: _userTransactions.map((e) {
              //! Transaction Card.
              return Container(
                height: 85,
                child: Card(
                  elevation: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //! Transaction Title and Date.
                      Flexible(
                        fit: FlexFit.tight,
                        child: Container(
                          margin: const EdgeInsets.only(top: 3, left: 25),
                          height: 45,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              //! Title.
                              FittedBox(
                                child: Text(
                                  e.title,
                                  // style: Theme.of(context).textTheme.bodyText1,
                                  style: const TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                    // color: Color(0xFF865439),
                                  ),
                                ),
                              ),
                              //! Date.
                              Text(
                                DateFormat.yMMMd().format(e.date),
                                style: TextStyle(
                                  // color: Color(0xFF87AAAA),
                                  color: Theme.of(context).accentColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //! Price Box.
                      Container(
                        // margin: const EdgeInsets.fromLTRB(17, 10, 15, 10),
                        // width: 70,
                        // height: 70,
                        // decoration: const BoxDecoration(
                        // border: Border.all(
                        //   // color: const Color(0xFF865439),
                        //   color: Theme.of(context).primaryColor,
                        //   width: 1,
                        // ),
                        // borderRadius:
                        //     const BorderRadius.all(Radius.circular(100)),
                        // ),
                        padding: const EdgeInsets.fromLTRB(12, 0, 15, 0),
                        //! Price Value
                        child: Text(
                          "Rs. ${e.amount.toStringAsFixed(0)}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            // color: Color(0xFF865439),
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0x11455A64),
                            ),
                          ),
                        ),
                      ),
                      //! Delete Transaction Button.
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: IconButton(
                          onPressed: () => deleteTransaction(e.id),
                          icon: const Icon(
                            Icons.delete,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
  }
}
