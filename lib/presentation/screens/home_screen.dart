import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:personal_expenses/data/model/expense_model.dart';
import 'package:personal_expenses/presentation/screens/add_expense_widget.dart';
import 'package:personal_expenses/presentation/widgets/expense_widget.dart';
import 'package:personal_expenses/providers/expense_provider.dart';
import 'package:provider/provider.dart';
import 'package:personal_expenses/presentation/widgets/expenses_sum.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/home-screen';

  @override
  Widget build(BuildContext context) {
    List<ExpenseModel> expensesList =
        context.watch<ExpenseProvider>().expensesList;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "Personal Expenses",
          style: TextStyle(color: Colors.black, fontSize: 23),
        ),
        toolbarHeight: 200,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 20,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
                iconSize: 50,
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (_) {
                        return const AddExpenseScreen();
                      });
                },
                icon: Icon(
                  Icons.add_circle,
                  color: HexColor("#267b7b"),
                )),
          )
        ],
      ),
      body: Stack(
        children: [
          const Image(image: AssetImage('assets/images/appbar_background.png')),
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 170),
                child: ExpensesSum(),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return ExpenseWidget(
                      expense: expensesList[index],
                    );
                  },
                  key: UniqueKey(),
                  itemCount: expensesList.length,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
