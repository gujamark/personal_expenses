import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/data/model/expense_model.dart';
import 'package:personal_expenses/providers/expense_provider.dart';
import 'package:provider/provider.dart';

class ExpenseDetailsScreen extends StatelessWidget {
  ExpenseDetailsScreen({Key? key}) : super(key: key);

  final DateFormat f = DateFormat("dd/MM/yyyy");

  @override
  Widget build(BuildContext context) {
    ExpenseModel selectedExpense =
        context.watch<ExpenseProvider>().selectedExpense;

    return Container(
      color: HexColor("#C3F8ED"),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Center(
              child: Text(
                selectedExpense.expenseTitle,
                style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Expense Amount",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                Text(selectedExpense.amount.toString(),
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Date",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54)),
                Text(f.format(selectedExpense.date),
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54)),
              ],
            ),
            Row(
              children: [],
            ),
          ],
        ),
      ),
    );
  }
}
