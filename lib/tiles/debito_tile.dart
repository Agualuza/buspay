
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DebitosTile extends StatelessWidget {

  final DocumentSnapshot snapshot;

  DebitosTile(this.snapshot);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25.0,
        backgroundColor: Colors.transparent,
        child: Icon(Icons.remove_circle_outline,color: Colors.red,)
      ),
      title: Text(snapshot.data["data"]),
      trailing: Text("- R\$${snapshot.data["valor"]}" ),
      onTap: (){},
    );
  }
}
