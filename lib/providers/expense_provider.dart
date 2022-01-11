import 'package:flutter/material.dart';
import 'package:personal_expenses/data/model/expense_model.dart';
import 'package:personal_expenses/data/repository/expense_repository.dart';

class ExpenseProvider extends ChangeNotifier {
  List<ExpenseModel> expensesList = [];
  ExpenseRepository expRepo = ExpenseRepository();
  double sumOfExpenses = 0;
  late ExpenseModel selectedExpense;

  ExpenseProvider() {
    fetchExpensesList();
  }

  void fetchExpensesList() async {
    expensesList = (await expRepo.fetchExpenses())!;
    sumOfExpenses = 0;
    for (var element in expensesList) {
      sumOfExpenses += element.amount;
    }
    notifyListeners();
  }

  void addExpense(ExpenseModel expense) async {
    await expRepo.addExpense(expense);
    fetchExpensesList();
  }

  void updateExpense() async {
    await expRepo.updateExpense(selectedExpense);
    fetchExpensesList();
  }
}
