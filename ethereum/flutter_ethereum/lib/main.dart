import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:web3dart/web3dart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "flutter ethereum demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'NGCoin'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Client httpClient;
  Web3Client ethClient;
  bool data = false;
  final myAddress = "0xaaC3EFcA2B5aFcb8eC36367f7c0Ad96E358C1803";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.gray300,
      body: ZStack([
        VxBox()
            .blue600
            .size(context.screenWidth, context.safePercentHeight * 30)
            .make(),
        VStack([
          (context.percentHeight * 10).heightBox,
          "\$NGCoin".text.xl4.white.bold.center.makeCentered().py16(),
          (context.percentHeight * 5).heightBox,
          VxBox(
                  child: VStack([
            "Balance".text.gray700.xl2.semiBold.makeCentered(),
            10.heightBox,
            data
                ? "\$1".text.bold.xl6.makeCentered()
                : CircularProgressIndicator().centered()
          ]))
              .p16
              .white
              .size(context.screenWidth, context.percentHeight * 18)
              .rounded
              .shadowXl
              .make()
              .p16(),
          30.heightBox,
          HStack(
            [
              FlatButton.icon(
                onPressed: () {},
                color: Colors.blue,
                shape: Vx.roundedSm,
                icon: Icon(Icons.refresh, color: Colors.white),
                label: "Refresh".text.white.make(),
              ).h(50),
              FlatButton.icon(
                onPressed: () {},
                color: Colors.green,
                shape: Vx.roundedSm,
                icon: Icon(Icons.call_made_outlined, color: Colors.white),
                label: "Deposit".text.white.make(),
              ).h(50),
              FlatButton.icon(
                onPressed: () {},
                color: Colors.red,
                shape: Vx.roundedSm,
                icon: Icon(Icons.call_received_outlined, color: Colors.white),
                label: "Withdraw".text.white.make(),
              ).h(50),
            ],
            alignment: MainAxisAlignment.spaceAround,
            axisSize: MainAxisSize.max,
          ).p16(),
        ]),
      ]),
    );
  }
}
