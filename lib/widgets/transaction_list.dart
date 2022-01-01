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
                      //! Price Box.
                      Container(
                        margin: const EdgeInsets.fromLTRB(17, 10, 15, 10),
                        width: 85,
                        // height: 70,
                        decoration: BoxDecoration(
                          border: Border.all(
                            // color: const Color(0xFF865439),
                            color: Theme.of(context).primaryColor,
                            width: 1,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100)),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 11,
                          vertical: 13,
                        ),
                        //! Price Value
                        child: FittedBox(
                          child: Text(
                            e.amount.toStringAsFixed(0),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              // fontSize: 17,
                              // color: Color(0xFF865439),
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                      //! Transaction Title and Date.
                      Flexible(
                        fit: FlexFit.tight,
                        child: Container(
                          margin: const EdgeInsets.only(top: 3),
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
