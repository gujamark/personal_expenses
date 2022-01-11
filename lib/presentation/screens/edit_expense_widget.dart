import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/data/model/expense_model.dart';
import 'package:personal_expenses/presentation/ui/button.dart';
import 'package:personal_expenses/providers/expense_provider.dart';
import 'package:provider/provider.dart';

class EditExpenseScreen extends StatefulWidget {
  const EditExpenseScreen({Key? key}) : super(key: key);

  @override
  State<EditExpenseScreen> createState() => _EditExpenseScreenState();
}

class _EditExpenseScreenState extends State<EditExpenseScreen> {
  final _formKey = GlobalKey<FormState>();

  DateFormat f = DateFormat("DD/MM/yyyy");
  TextEditingController idCont = TextEditingController();
  TextEditingController amountCont = TextEditingController();
  TextEditingController titleCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ExpenseModel expenseToEdit =
        context.watch<ExpenseProvider>().selectedExpense!;

    DateTime date = expenseToEdit.date;
    idCont.text = expenseToEdit.id.toString();
    amountCont.text = expenseToEdit.amount.toString();
    titleCont.text = expenseToEdit.expenseTitle.toString();

    return Container(
      color: HexColor("#C3F8ED"),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) => context
                    .read<ExpenseProvider>()
                    .selectedExpense!
                    .id = int.parse(value),
                controller: idCont,
                style: const TextStyle(
                    color: Colors.black45, fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    hintText: "Expense ID",
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Valid ID";
                  }
                },
              ),
              TextFormField(
                controller: amountCont,
                onChanged: (value) => context
                    .read<ExpenseProvider>()
                    .selectedExpense!
                    .amount = num.parse(value),
                style: const TextStyle(
                    color: Colors.black45, fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    hintText: "Expense Amount",
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Valid Amount";
                  }
                },
              ),
              TextFormField(
                controller: titleCont,
                onChanged: (value) => context
                    .read<ExpenseProvider>()
                    .selectedExpense!
                    .expenseTitle = value,
                style: const TextStyle(
                    color: Colors.black45, fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    hintText: "Expense Title",
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Valid Title";
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    f.format(date),
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
                              initialDate: date,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2025))
                          .then((pickedDate) {
                        if (pickedDate == null) return;
                        setState(() {
                          context
                              .read<ExpenseProvider>()
                              .selectedExpense!
                              .date = pickedDate;
                        });
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: CustomButton(
                  width: 120,
                  callback: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<ExpenseProvider>().updateExpense();
                      Navigator.pop(context);
                    }
                  },
                  text: "Edit",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
