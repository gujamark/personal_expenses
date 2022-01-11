import 'package:flutter/material.dart';
import 'package:personal_expenses/presentation/screens/auth_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_expenses/providers/expense_provider.dart';
import 'package:personal_expenses/routes/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => ExpenseProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white),
      home: const AuthenticationScreen(),
      routes: routes,
    );
  }
}
