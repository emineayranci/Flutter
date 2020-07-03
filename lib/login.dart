import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginIslemleri extends StatefulWidget {
  @override
  _LoginIslemleriState createState() => _LoginIslemleriState();
}

String mail = "";
String sifre = "";

class _LoginIslemleriState extends State<LoginIslemleri> {
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
                "Giriş Yap",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.lightBlue,
              onPressed: _emailveSifreLogin,
            ),
            RaisedButton(
              child: Text(
                "Şifremi Unuttum",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.lightBlue,
              onPressed: _sifremiUnuttum,
            ),
            Text(mesaj),
          ],
        ),
      ),
    );
  }

  void _emailveSifreLogin() {
    _auth
        .signInWithEmailAndPassword(email: mail.trim(), password: sifre.trim())
        .then((oturumAcmisAuth) {
      var oturumAcmisKullanici = oturumAcmisAuth.user;

      if (oturumAcmisKullanici.isEmailVerified) {
        Navigator.pushNamed(context, "/usersayfasi");
      } else {
        setState(() {
          mesaj = " Emailinizi onaylayınız";
        });
        _auth.signOut();
      }
    }).catchError((e) {
      debugPrint(e.toString());
      setState(() {
        mesaj = "Email/Sifre hatalı";
      });
    });
  }

  void _sifremiUnuttum() {
    _auth.sendPasswordResetEmail(email: mail).then((a) {
      setState(() {
        mesaj += "\nSıfırlama maili gönderildi";
      });
    }).catchError((e) {
      setState(() {
        mesaj += "\nŞifremi unuttum mailinde hata $e";
      });
    });
  }
}
