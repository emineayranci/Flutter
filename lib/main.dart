import 'package:flutter/material.dart';
import 'package:flutterproje1/login.dart';
import 'package:flutterproje1/register.dart';
import 'package:flutterproje1/userpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => MyHomePage(),
        '/registersayfasi': (context) => RegisterIslemleri(),
        '/loginsayfasi': (context) => LoginIslemleri(),
        '/usersayfasi': (context) => UserSayfasi()
      },
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Authentication"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text(
                "Yeni Kullanıcı Olustur",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.lightBlue,
              onPressed: () => Navigator.pushNamed(context, "/registersayfasi"),
            ),
            RaisedButton(
              child: Text(
                "Giriş Yap",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.lightBlue,
              onPressed: () => Navigator.pushNamed(context, "/loginsayfasi"),
            ),
          ],
        ),
      ),
    );
  }
}
