import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transactions.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> _userTransactions;

  TransactionList(this._userTransactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _userTransactions.map((e) {
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
                    // color: const Color(0xFF865439),
                    color: Theme.of(context).primaryColor,
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 11,
                  vertical: 13,
                ),
                //! Price Value
                child: Text(
                  e.amount.toStringAsFixed(0),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                    // color: Color(0xFF865439),
                    color: Theme.of(context).primaryColor,
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
                      // style: Theme.of(context).textTheme.bodyText1,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        // color: Color(0xFF865439),
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
            ],
          ),
        );
      }).toList(),
    );
  }
}
