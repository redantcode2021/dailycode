import 'package:flutter/material.dart';
import 'package:foo_bar/screens/auth/decoration_function.dart';
import 'package:foo_bar/screens/auth/title.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignInForm(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Expanded(
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: LoginTitle(
                    title: "Welcome\nBack",
                  )),
            ),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: EmailTextFormField(
                      decoration: signInInputDecoration(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: PasswordTextFormField(
                      decoration: signInInputDecoration(),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
