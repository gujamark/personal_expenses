import 'package:flutter/material.dart';
import 'package:personal_expenses/presentation/screens/home_screen.dart';
import 'package:personal_expenses/presentation/ui/button.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  static const routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/images/logo.png'),
              width: 150,
            ),
            const SizedBox(
              height: 40,
            ),
            CustomButton(text: "", callback: () {}),
            const SizedBox(
              height: 18,
            ),
            CustomButton(
                text: "LOGIN",
                callback: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const HomeScreen()));
                }),
          ],
        ),
      ),
    );
  }
}
