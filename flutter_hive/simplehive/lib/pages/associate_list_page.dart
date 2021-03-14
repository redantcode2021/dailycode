import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simplehive/associate_data.dart';
import 'package:simplehive/widgets/associate_list.dart';

class AssociateListPage extends StatelessWidget {
  const AssociateListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<AssociateData>(context, listen: false).getAssociates();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Associates',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        backgroundColor: Colors.lightBlueAccent,
        elevation: 16.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                child: AssociateList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.lightBlueAccent,
        tooltip: "Add",
        onPressed: () {
          Navigator.pushNamed(context, '/AddAssociatePage');
        },
      ),
    );
  }
}
