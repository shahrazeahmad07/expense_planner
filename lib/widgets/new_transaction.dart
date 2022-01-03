import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final void Function(String title, double amount, DateTime choosedDate)
      addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  void datePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2001),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          left: 15,
          top: 1,
          right: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom + 50,
        ),
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
              textInputAction: TextInputAction.next,
            ),
            //! Add Transaction Amount
            TextField(
              decoration: const InputDecoration(
                labelText: "Amount",
              ),
              keyboardType: TextInputType.number,
              controller: amountController,
              textInputAction: TextInputAction.next,
            ),
            //! Date Selection Area.
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                //! Calender button.
                IconButton(
                  onPressed: datePicker,
                  icon: Icon(
                    Icons.calendar_today_outlined,
                    color: Theme.of(context).accentColor,
                  ),
                ),
                //! Selected Date text.
                Text(
                  DateFormat.yMd().format(selectedDate),
                  style: const TextStyle(
                    fontFamily: 'Quicksand',
                    // fontSize: 10,
                    color: Color(0xFF607d8b),
                    fontWeight: FontWeight.normal,
                  ),
                  // style: TextStyle(
                  //   color: .color
                  // ),
                ),
              ],
            ),
            //! Submit transaction Button.
            Container(
              alignment: Alignment.bottomRight,
              margin: const EdgeInsets.only(top: 6),
              child: ElevatedButton(
                onPressed: () {
                  if (titleController.text.isEmpty ||
                      amountController.text.isEmpty) {
                    return;
                  }
                  final inputText = titleController.text;
                  final inputAmout = double.parse(amountController.text);

                  widget.addNewTransaction(
                    inputText,
                    inputAmout,
                    selectedDate,
                  );
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Add Transaction",
                  style: TextStyle(
                    fontSize: 18,
                    // fontWeight: FontWeight.bold,
                    // letterSpacing: 1,
                  ),
                ),
                // style: ButtonStyle(
                //   backgroundColor:
                //       MaterialStateProperty.all(const Color(0xFF435454)),
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
