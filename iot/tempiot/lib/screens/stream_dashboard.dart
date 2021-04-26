import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:tempiot/widgets/circle_progress.dart';

class StreamDashboard extends StatefulWidget {
  StreamDashboard({Key key}) : super(key: key);

  @override
  _StreamDashboardState createState() => _StreamDashboardState();
}

class _StreamDashboardState extends State<StreamDashboard> {
  final _databaseRef = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 24.0,
        ),
        child: Stack(
          children: [
            StreamBuilder(
                stream: _databaseRef.onValue,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Scaffold(
                      body: Center(
                        child: Text("Error: ${snapshot.error}"),
                      ),
                    );
                  }

                  if (snapshot.connectionState == ConnectionState.active) {
                    double temp =
                        snapshot.data.snapshot.value['celcius'].toDouble();
                    double humidity =
                        snapshot.data.snapshot.value['humidity'].toDouble();

                    return Scaffold(
                        body: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomPaint(
                          foregroundPainter: CircleProgress(temp, true),
                          child: Container(
                            height: 170,
                            width: 170,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "${temp.toInt()}",
                                    style: TextStyle(
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '°C',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text("Temperature"),
                                ],
                              ),
                            ),
                          ),
                        ),
                        CustomPaint(
                          foregroundPainter: CircleProgress(humidity, true),
                          child: Container(
                            height: 170,
                            width: 170,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "${humidity.toInt()}",
                                    style: TextStyle(
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '°%',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Humidity",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ));
                  }

                  // Loading State
                  return Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
