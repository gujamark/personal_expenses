import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/data/model/expense_model.dart';
import 'package:personal_expenses/presentation/screens/expense_details.dart';
import 'package:personal_expenses/providers/expense_provider.dart';
import 'package:provider/provider.dart';

class ExpenseWidget extends StatelessWidget {
  const ExpenseWidget({Key? key, required this.expense}) : super(key: key);

  final ExpenseModel expense;

  @override
  Widget build(BuildContext context) {
    String dateString = DateFormat("dd-MMM-yyyy").format(expense.date);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5)
            ],
            borderRadius: BorderRadius.circular(15)),
        child: ListTile(
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (_) {
                  context.read<ExpenseProvider>().getExpense(expense.id);
                  return ExpenseDetailsScreen();
                });
          },
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              expense.expenseTitle,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(dateString),
          ),
          trailing: Text(
            "${expense.amount.toStringAsFixed(2).toString().replaceFirst(".", ",")} \$",
            style: const TextStyle(
                fontSize: 22,
                color: Colors.black54,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
