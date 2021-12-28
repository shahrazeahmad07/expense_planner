import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void Function(String title, double amount) addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  addNewTransaction(
                    titleController.text,
                    double.parse(amountController.text),
                  );
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
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xFF87AAAA)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
