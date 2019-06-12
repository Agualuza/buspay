import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/user_models.dart';
import 'package:qrcode_reader/qrcode_reader.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:scoped_model/scoped_model.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  Future<String> _barcodeString;



  Future<String> _api(model) async {
    setState(() {
       _barcodeString = new QRCodeReader()
          .setAutoFocusIntervalInMs(200)
          .setForceAutoFocus(true)
          .setTorchEnabled(true)
          .setHandlePermissions(true)
          .setExecuteAfterPermissionGranted(true)
          .scan();
    });
_api2(await _barcodeString,model);
}

  Future<String> _api2(String url,model) async {
    http.Response response = await http.get(url);
    var jsonResponse = json.decode(response.body);

    if((url != null)){
      await Firestore.instance.collection("users").document(model.firebaseUser.uid)
          .collection("historico").document().setData(
          {
            "data": jsonResponse["data"],
            "valor": jsonResponse["valor"]
          }
      );

      _onSuccess();
    }




  }

  /*Future<Map> _empty() async {

    var teste = Map();
    teste["texo"] = 'Você ainda não tem viagens!';
    return teste;
  }*/

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(builder: (context, child, model){
    return Scaffold(
      body: /*Center(
          child: FutureBuilder<String>(
              future: _barcodeString,
              builder: (BuildContext context, AsyncSnapshot<String> snap) {
                var aux = Map();
                aux["texto"] = 'Você ainda não tem viagens!';
                return FutureBuilder<Map>(
                  future: snap.data != null ? _api2(snap.data) : aux,
                  builder: (BuildContext context, AsyncSnapshot<Map> snapshot){
                    return new Text(snapshot.data["data"] != null ? snapshot.data["data"] : '');
                  },
                );
              })
      ),*/
      Container(),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {

          _api(model);


        },
        tooltip: 'Reader the QRCode',
        child: new Icon(Icons.attach_money),
      ),
    );
    }
    );
  }


  void _onSuccess() {
    final snackbar = SnackBar(
      content: Text(
        "Debitado com Sucesso!",
      ),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 5),
    );

    Scaffold.of(context).showSnackBar(snackbar);
  }


}

