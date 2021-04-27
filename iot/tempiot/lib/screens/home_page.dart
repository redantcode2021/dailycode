import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:tempiot/screens/stream_dashboard.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final databaseRef = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: StreamDashboard()), // Dashboard View
    );
  }
}
