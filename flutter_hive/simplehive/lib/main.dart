import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:simplehive/associate_data.dart';
import 'package:simplehive/model/associate.dart';
import 'package:simplehive/pages/add_associate_page.dart';
import 'package:simplehive/pages/associate_list_page.dart';

void main() {
  Hive.registerAdapter(AssociateAdapter());
  runApp(AssociateApp());
}

// Initialize Hive
Future _initHive() async {
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
}

class AssociateApp extends StatelessWidget {
  const AssociateApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AssociateData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Associates',
        theme: ThemeData(primaryColor: Colors.lightBlueAccent),
        initialRoute: "/",
        routes: {
          "/": (context) => FutureBuilder(
              future: _initHive(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.error != null) {
                    print(snapshot.error);
                    return Scaffold(
                      body: Center(
                        child: Text("Error establishing connection to hive"),
                      ),
                    );
                  } else {
                    return AssociateListPage();
                  }
                } else
                  return Scaffold();
              }),
          "/AddAssociatePage": (context) => AddAssociatePage(),
        },
      ),
    );
  }
}
