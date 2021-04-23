import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:tempiot/widgets/circle_progress.dart';

import '../constants.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  bool isLoading = false;
  final databaseRef = FirebaseDatabase.instance.reference();

  AnimationController progressController;
  Animation<double> tempAnimation;
  Animation<double> humidityAnimation;

  @override
  void initState() {
    databaseRef.once().then((DataSnapshot snapshot) {
      double temp = snapshot.value['celcius'].toDouble();
      double humidity = snapshot.value['humidity'].toDouble();

      isLoading = true;
      _dashboardInit(temp, humidity);
    });
    super.initState();
  }

  void _dashboardInit(double temp, double humidity) {
    progressController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000));

    tempAnimation =
        Tween<double>(begin: -50, end: temp).animate(progressController)
          ..addListener(() {
            setState(() {});
          });
    humidityAnimation =
        Tween<double>(begin: 0, end: humidity).animate(progressController)
          ..addListener(() {
            setState(() {});
          });

    progressController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: isLoading
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CustomPaint(
                      foregroundPainter:
                          CircleProgress(tempAnimation.value, true),
                      child: Container(
                        width: 200,
                        height: 200,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Temperature"),
                              Text(
                                "${tempAnimation.value.toInt()}",
                                style: TextStyle(
                                    fontSize: 50, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '°C',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    CustomPaint(
                      foregroundPainter:
                          CircleProgress(tempAnimation.value, true),
                      child: Container(
                        width: 200,
                        height: 200,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Humidity"),
                              Text(
                                "${humidityAnimation.value.toInt()}",
                                style: TextStyle(
                                    fontSize: 50, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '%',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Text(
                  "Loading...",
                  style: Constants.boldHeading,
                )),
    );
  }
}
