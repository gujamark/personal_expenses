import 'package:flutter/material.dart';
import 'package:personal_expenses/data/model/expense_model.dart';
import 'package:personal_expenses/data/repository/expense_repository.dart';

class ExpenseProvider extends ChangeNotifier {
  List<ExpenseModel> expensesList = [];
  ExpenseRepository expensesRepository = ExpenseRepository();
  double sumOfExpenses = 0;
  ExpenseModel? selectedExpense;

  ExpenseProvider() {
    fetchExpensesList();
  }

  void fetchExpensesList() async {
    expensesList = (await expensesRepository.fetchExpenses())!;
    sumOfExpenses = 0;
    for (var element in expensesList) {
      sumOfExpenses += element.amount;
    }
    notifyListeners();
  }

  void addExpense(ExpenseModel expense) async {
    await expensesRepository.addExpense(expense);
    fetchExpensesList();
  }

  void updateExpense() async {
    await expensesRepository.updateExpense(selectedExpense!);
    fetchExpensesList();
  }

  void removeExpense(expenseId) async {
    await expensesRepository.deleteExpense(expenseId);
    fetchExpensesList();
  }

  void getExpense(int expenseId) async {
    selectedExpense = await expensesRepository.getExpense(expenseId);
    notifyListeners();
  }
}
