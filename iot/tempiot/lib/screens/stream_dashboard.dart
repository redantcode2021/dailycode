import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StreamDashboard extends StatefulWidget {
  StreamDashboard({Key key}) : super(key: key);

  @override
  _StreamDashboardState createState() => _StreamDashboardState();
}

class _StreamDashboardState extends State<StreamDashboard> {
  final _databaseRef = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> weatherData = [
      {
        "room": "002",
        "temperature": 27,
        "image": "assets/images/Sun cloud mid rain.png",
        "humidity": 34
      },
      {
        "room": "003",
        "temperature": 30,
        "image": "assets/images/Sun cloud mid rain.png",
        "humidity": 38
      },
      {
        "room": "004",
        "temperature": 31,
        "image": "assets/images/Sun cloud mid rain.png",
        "humidity": 39
      },
      {
        "room": "005",
        "temperature": 29,
        "image": "assets/images/Sun cloud mid rain.png",
        "humidity": 38
      },
      {
        "room": "006",
        "temperature": 30,
        "image": "assets/images/Sun cloud mid rain.png",
        "humidity": 38
      },
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: StreamBuilder(
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
              double temp = snapshot.data.snapshot.value['celcius'].toDouble();
              double humidity =
                  snapshot.data.snapshot.value['humidity'].toDouble();

              return Scaffold(
                  body: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/sky-graphic.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            child: AppBar(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              leading: IconButton(
                                icon: Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              top: 100,
                              left: 20,
                              right: 20,
                            ),
                            child: TextField(
                              onChanged: (value) {},
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textInputAction: TextInputAction.search,
                              onSubmitted: (value) {},
                              decoration: InputDecoration(
                                suffix: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                                hintStyle: TextStyle(color: Colors.white),
                                hintText: 'Search'.toUpperCase(),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(0.0, 1.5),
                            child: SizedBox(
                              height: 10,
                              width: 10,
                              child: OverflowBox(
                                minWidth: 0.0,
                                maxWidth: MediaQuery.of(context).size.width,
                                minHeight: 0.0,
                                maxHeight:
                                    (MediaQuery.of(context).size.height / 3.5),
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: Card(
                                        color: Colors.white,
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: 15, left: 20, right: 20),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Center(
                                                    child: Text(
                                                      "Markas Room 01"
                                                          .toUpperCase(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .caption
                                                          .copyWith(
                                                            color:
                                                                Colors.black45,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ),
                                                  Center(
                                                    child: Text(
                                                      DateFormat()
                                                          .add_MMMMEEEEd()
                                                          .format(
                                                              DateTime.now()),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .caption
                                                          .copyWith(
                                                            color:
                                                                Colors.black45,
                                                            fontSize: 14,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Container(
                                                  padding:
                                                      EdgeInsets.only(left: 50),
                                                  child: Column(
                                                    children: <Widget>[
                                                      Text(
                                                        "Temperature",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .caption
                                                            .copyWith(
                                                              color: Colors
                                                                  .black45,
                                                              fontSize: 16,
                                                            ),
                                                      ),
                                                      Text(
                                                        (temp != null)
                                                            ? '${temp.toInt()}\u2103'
                                                            : '',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline4
                                                            .copyWith(
                                                              color: Colors
                                                                  .black45,
                                                            ),
                                                      ),
                                                      Text(
                                                        "It's ${temp.toInt()}\u2103 in the room",
                                                        style: TextStyle(
                                                          color: Colors.black45,
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      right: 20),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Container(
                                                        width: 100,
                                                        height: 100,
                                                        decoration:
                                                            BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                          image: AssetImage(
                                                              'assets/images/Big rain drops.png'),
                                                          fit: BoxFit.cover,
                                                        )),
                                                      ),
                                                      Container(
                                                        child: Text(
                                                          (humidity != null)
                                                              ? "Humidity: ${humidity.toInt()}\u0025"
                                                              : " ",
                                                          style: TextStyle(
                                                            color:
                                                                Colors.black45,
                                                            fontSize: 14.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Stack(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            padding: EdgeInsets.only(top: 180),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      'other room'.toUpperCase(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption
                                          .copyWith(
                                              fontSize: 16,
                                              color: Colors.black45,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    height: 150,
                                    child: ListView.separated(
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      separatorBuilder: (context, index) =>
                                          VerticalDivider(
                                        color: Colors.transparent,
                                        width: 5,
                                      ),
                                      itemCount: weatherData.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          width: 140,
                                          height: 150,
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Container(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    (weatherData.length > 0)
                                                        ? "Room: "
                                                            '${weatherData[index]["room"]}'
                                                        : ' ',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .caption
                                                        .copyWith(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black45,
                                                        ),
                                                  ),
                                                  Text(
                                                    (weatherData.length > 0)
                                                        ? '${weatherData[index]["temperature"]}\u2103'
                                                        : ' ',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .caption
                                                        .copyWith(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black45,
                                                        ),
                                                  ),
                                                  Container(
                                                    width: 50,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/images/Sun cloud mid rain.png'),
                                                      fit: BoxFit.cover,
                                                    )),
                                                  ),
                                                  Text(
                                                    (weatherData.length > 0)
                                                        ? "Humidity: "
                                                            '${weatherData[index]["humidity"]}'
                                                        : ' ',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .caption
                                                        .copyWith(
                                                          color: Colors.black45,
                                                          fontSize: 12,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
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
    );
  }
}
