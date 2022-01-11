import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/presentation/screens/edit_expense_widget.dart';
import 'package:personal_expenses/presentation/widgets/circle_button.dart';
import 'package:personal_expenses/providers/expense_provider.dart';
import 'package:provider/provider.dart';

class ExpenseDetailsScreen extends StatelessWidget {
  ExpenseDetailsScreen({Key? key}) : super(key: key);

  final DateFormat f = DateFormat("dd/MM/yyyy");

  @override
  Widget build(BuildContext context) {
    var selectedExpense = context.watch<ExpenseProvider>().selectedExpense;

    return Container(
      color: HexColor("#C3F8ED"),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 30, right: 30, top: 40, bottom: 100),
        child: selectedExpense == null
            ? const Text("Loading")
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
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
                          Text("${selectedExpense.amount.toString()} \$",
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
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleButton(
                        icon: Icons.edit,
                        callback: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (_) {
                                return const EditExpenseScreen();
                              });
                        },
                      ),
                      CircleButton(
                        icon: Icons.delete,
                        callback: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text(
                                    "Delete?",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  content: Text(selectedExpense.expenseTitle),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          context
                                              .read<ExpenseProvider>()
                                              .removeExpense(
                                                  selectedExpense.id);
                                          Navigator.pop(context, true);
                                        },
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.red),
                                        child: const Text(
                                          "Yes",
                                          style: TextStyle(color: Colors.white),
                                        )),
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context, false);
                                        },
                                        child: const Text("No"))
                                  ],
                                );
                              }).then((agreed) {
                            if (agreed) Navigator.pop(context);
                          });
                        },
                      )
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
