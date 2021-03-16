import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simplehive/associate_data.dart';
import 'package:simplehive/model/associate.dart';
import 'package:simplehive/pages/associate_view_page.dart';

class AssociateTile extends StatelessWidget {
  const AssociateTile({Key key, this.titleIndex}) : super(key: key);

  final int titleIndex;
  @override
  Widget build(BuildContext context) {
    return Consumer<AssociateData>(builder: (context, associateData, child) {
      Associate currentAssociate = associateData.getAssociate(titleIndex);
      return Container(
        decoration: BoxDecoration(
          color: titleIndex % 2 == 0 ? Colors.grey : Colors.white,
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.lightBlueAccent,
            child: Text(
              currentAssociate.name.substring(0, 1),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
          ),
          title: Text(
            currentAssociate?.name ?? "",
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            currentAssociate?.phone.toString() ?? "",
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Provider.of<AssociateData>(context, listen: false)
                .setActiveAssociate(currentAssociate.key);

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return AssociateView();
              }),
            );
          },
        ),
      );
    });
  }
}
