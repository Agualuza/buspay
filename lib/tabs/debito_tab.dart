import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/user_models.dart';
import 'package:flutter_app/tiles/debito_tile.dart';
import 'package:scoped_model/scoped_model.dart';


class DebitosTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(builder: (context, child, model) {
      return FutureBuilder<QuerySnapshot>(
        future: Firestore.instance.collection("users").document(
            model.firebaseUser.uid).collection("historico").getDocuments(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              ),
            );
          } else {
            var dividerTiles = ListTile.divideTiles(

                tiles: snapshot.data.documents.map((doc) {
                  return DebitosTile(doc);
                }).toList(),
                color: Colors.grey[500])
                .toList();

            return ListView(
              children: dividerTiles,
            );
          }
        },
      );
    }
    );
  }


}