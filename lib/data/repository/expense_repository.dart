import 'package:dio/dio.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:personal_expenses/data/model/expense_model.dart';

class ExpenseRepository {
  Dio dio = Dio();
  var expensesList = <ExpenseModel>[].obs;

  final basePath = 'http://10.0.2.2:8080';

  Future<List<ExpenseModel>?> fetchExpenses() async {
    final response = await dio.get("$basePath/expenses");
    if (response.statusCode == 200) {
      var loadedExpensesList = <ExpenseModel>[];
      response.data.forEach((loadedExpense) {
        ExpenseModel expense = ExpenseModel.fromJson(loadedExpense);
        loadedExpensesList.add(expense);
        expensesList = loadedExpensesList.obs;
        return expensesList;
      });
    }
    return expensesList;
  }

  Future<ExpenseModel> addExpense(ExpenseModel expense) async {
    final response =
        await dio.post("$basePath/add-expense", data: expense.toJson());
    if (response.statusCode == 200) {
      var loadedExpense = response.data;
      ExpenseModel expense = ExpenseModel.fromJson(loadedExpense);
      expensesList.add(expense);
      return expense;
    }
    return expense;
  }

  Future<String> updateExpense(ExpenseModel expense) async {
    final response =
        await dio.put("$basePath/update-expense", data: expense.toJson());
    if (response.statusCode == 200) {
      expensesList[expensesList
          .indexWhere((element) => element.id == expense.id)] = expense;
      return response.data;
    }
    return response.data;
  }

  Future<String> deleteExpense(expenseId) async {
    final response = await dio.delete("$basePath/delete-expense/$expenseId");
    if (response.statusCode == 200) {
      expensesList.removeWhere((element) => element.id == expenseId);
      return response.data;
    }
    return response.data;
  }

  Future<ExpenseModel> getExpense(expenseId) async {
    final response = await dio.get("$basePath/expense/$expenseId");
    if (response.statusCode == 200) {
      return ExpenseModel.fromJson(response.data);
    }
    return response.data;
  }
}
