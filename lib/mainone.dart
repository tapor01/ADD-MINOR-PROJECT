import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_one/home.dart';
import 'package:project_one/login.dart';
import 'package:project_one/service.dart';
import 'package:project_one/sign.dart';
import 'package:project_one/variable.dart';
import 'package:project_one/wrapper.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User?>.value(
          
          value: AuthService().user,
          
          initialData: null,
          child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              cardColor: Colors.tealAccent[400],
              cardTheme: CardTheme(
                  shape: ContinuousRectangleBorder(
                      side: BorderSide.none,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(500.0))))),
          home: Wrapper()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Map<int, Color> colorCodes = {
      1: Color.fromRGBO(167, 255, 235, 1),
    };
    // MaterialColor colorone = new MaterialColor(0XFFA7FFEB, colorCodes);

    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      child: Center(
        child: Align(
          alignment: Alignment.topCenter,
          child: Card(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 40.0, left: 10.0),
                      alignment: Alignment.topCenter,
                      height: 90.0,
                      width: 90.0,
                      child: Text(
                        "GO",
                        style: TextStyle(
                            fontSize: 47.0,
                            color: Colors.teal[500],
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.0),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100.0)),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 100.0, left: 7.0),
                      alignment: Alignment.topCenter,
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(140.0)),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 30.0),
                  height: 15.0,
                  width: 15.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100.0)),
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(100.0)),
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.05,
                  margin: const EdgeInsets.only(top: 120.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Login();
                      }));
                    },
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                          fontWeight: FontWeight.w900, color: Colors.teal[500]),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              side: BorderSide(color: Color(0xFFA7FFEB)))),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      side: MaterialStateProperty.all(
                          BorderSide(color: Colors.white, width: 2.0)),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.05,
                  margin: const EdgeInsets.only(top: 20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SignIn();
                      }));
                    },
                    child: Text(
                      'REGISTER',
                      style: TextStyle(
                          fontWeight: FontWeight.w900, color: Colors.teal[500]),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              side: BorderSide(color: Color(0xFFA7FFEB)))),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      side: MaterialStateProperty.all(
                          BorderSide(color: Colors.white, width: 2.0)),
                    ),
                  ),
                ),
            
              ],
            ),
          ),
        ),
      ),
    ));
  }
}