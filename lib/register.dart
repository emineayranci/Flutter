import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterIslemleri extends StatefulWidget {
  @override
  _RegisterIslemleriState createState() => _RegisterIslemleriState();
}

String mail = "";
String sifre = "";

class _RegisterIslemleriState extends State<RegisterIslemleri> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String mesaj = "";

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
              child: TextField(
                obscureText: false,
                onChanged: (String s) {
                  mail = s;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'email',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                obscureText: true,
                onChanged: (String s) {
                  sifre = s;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            RaisedButton(
              child: Text(
                "Yeni Kullanıcı Olustur",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.lightBlue,
              onPressed: _emailveSifreRegister,
            ),
            Text(mesaj),
          ],
        ),
      ),
    );
  }

  void _emailveSifreRegister() async {
    var authResult = await _auth
        .createUserWithEmailAndPassword(
            email: mail.trim(), password: sifre.trim())
        .catchError((e) => debugPrint("Hata :" + e.toString()));

    var firebaseUser = authResult.user;
    if (firebaseUser != null) {
      firebaseUser
          .sendEmailVerification()
          .then((data) {})
          .catchError((e) => debugPrint("Mail gönderirken hata $e"));

      setState(() {
        mesaj = "Email gönderildi lütfen onaylayın ";
      });
      await Navigator.pushNamed(context, '/');
    }else{
      setState(() {
        mesaj = "bu mail kullanımda ";
      });
    }
  }
}
