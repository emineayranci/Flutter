import 'package:flutter/material.dart';

class UserSayfasi extends StatefulWidget {
  @override
  _UserSayfasiState createState() => _UserSayfasiState();
}

class _UserSayfasiState extends State<UserSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Authentication"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "Hoş geldiniz ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            RaisedButton(
              child: Text(
                "Çıkış Yap",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.lightBlue,
              onPressed: _cikisYap,
            ),
          ],
        ),
      ),
    );
  }

  void _cikisYap() {


    Navigator.pushNamed(context, "/");

  }
}
