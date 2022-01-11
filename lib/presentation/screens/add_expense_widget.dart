import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/data/model/expense_model.dart';
import 'package:personal_expenses/presentation/ui/button.dart';
import 'package:personal_expenses/presentation/ui/edit_formfield.dart';
import 'package:personal_expenses/providers/expense_provider.dart';
import 'package:provider/provider.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({Key? key}) : super(key: key);

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController id = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController title = TextEditingController();
  DateTime? date;

  DateFormat f = DateFormat("DD/MM/yyyy");

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor("#C3F8ED"),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              EditFormField(
                controller: id,
                hintText: "Please enter expense ID",
                errorText: "Please enter valid expense ID",
              ),
              EditFormField(
                controller: amount,
                hintText: "Please enter expense amount",
                errorText: "Please enter valid expense amount",
              ),
              EditFormField(
                controller: title,
                hintText: "Please enter expense title",
                errorText: "Please enter valid expense title",
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    date != null ? f.format(date!) : "Pick Date",
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                  CustomButton(
                    text: "Pick Date",
                    width: 120,
                    callback: () async {
                      FocusScope.of(context).unfocus();
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2025))
                          .then((pickedDate) {
                        if (pickedDate == null) return;
                        setState(() {
                          date = pickedDate;
                        });
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                    width: 120,
                    callback: () {
                      if (_formKey.currentState!.validate() && date != null) {
                        ExpenseModel expenseToCreate = ExpenseModel(
                            id: int.parse(id.text),
                            expenseTitle: title.text,
                            amount: num.parse(amount.text),
                            date: date!);
                        context
                            .read<ExpenseProvider>()
                            .addExpense(expenseToCreate);
                        Navigator.pop(context);
                      }
                    },
                    text: "ADD",
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
