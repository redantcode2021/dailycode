import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simplehive/associate_data.dart';
import 'package:simplehive/widgets/associate_tile.dart';

class AssociateList extends StatelessWidget {
  const AssociateList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return AssociateTile(
          titleIndex: index,
        );
      },
      itemCount: Provider.of<AssociateData>(context).associateCount,
      padding: EdgeInsets.fromLTRB(8.0, 6.0, 8.0, 4.0),
    );
  }
}
