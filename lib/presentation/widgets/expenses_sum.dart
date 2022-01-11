import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:personal_expenses/providers/expense_provider.dart';
import 'package:provider/provider.dart';

class ExpensesSum extends StatelessWidget {
  const ExpensesSum({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sumOfExpenses = context.watch<ExpenseProvider>().sumOfExpenses;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 200,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5)
              ],
              border: Border.all(color: HexColor("#717272"))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30, left: 25),
                child: Text(
                  "${sumOfExpenses.toStringAsFixed(2).replaceFirst(".", ",")} \$",
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
