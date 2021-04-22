import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tempiot/constants.dart';
import 'package:tempiot/screens/home_page.dart';
import 'package:tempiot/screens/login_page.dart';
import 'package:tempiot/utils/logger.dart';

class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // If Firebase App Init, snapshot has error
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("Error: ${snapshot.error}"),
            ),
          );
        }

        // Connection Initialized - Firebase App is running
        if (snapshot.connectionState == ConnectionState.done) {
          Log.i("Connection State is done");
          // StreamBuilder can check the login state live
          return StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, streamSnapshot) {
                // If Stream snapshot has error
                if (streamSnapshot.hasError) {
                  return Scaffold(
                    body: Center(
                      child: Text("Error: ${streamSnapshot.error}"),
                    ),
                  );
                }

                // Connection state active - Do the use login check inside the
                // if statement

                if (streamSnapshot.connectionState == ConnectionState.active) {
                  // Get the user
                  User _user = streamSnapshot.data;
                  Log.i("Connection state is Active");
                  // If the user is null, we're not logged in
                  if (_user == null) {
                    // User not login, head to login
                    Log.i("GO TO: Login page");
                    return LoginPage(); // LoginPage
                  } else {
                    // The user is loggen in, head to homepage
                    Log.i("GO TO Home Page");
                    return HomePage(); // HomePage;
                  }
                }
                // Checking the auth state - Loading
                return Scaffold(
                  body: Center(
                    child: Text(
                      "Checking Authentication...",
                      style: Constants.regularHeading,
                    ),
                  ),
                );
              });
        }
        // Connecting to Firebase - Loading
        Log.i("Firebase Loading");
        return Scaffold(
          body: Center(
            child: Text(
              "Initialization App ",
              style: Constants.regularHeading,
            ),
          ),
        );
      },
    );
  }
}
