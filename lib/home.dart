import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_one/main.dart';

import 'package:project_one/profile.dart';
import 'package:project_one/variable.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  var _razorpay = Razorpay();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.tealAccent[400],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100.0),
                topRight: Radius.circular(100.0),
                bottomLeft: Radius.circular(100.0),
                bottomRight: Radius.circular(100.0))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: AnimatedTextKit(
                animatedTexts: [
                  ColorizeAnimatedText('DEMO',
                      textStyle: GoogleFonts.pressStart2p(fontSize: 40.0),
                      colors: [
                        Color(0xFF004D40),
                        Colors.yellow,
                        Colors.orange,
                        Colors.purple,
                        Colors.amber,
                        Colors.teal
                      ]),
                ],
                isRepeatingAnimation: true,
                repeatForever: true,
              ),
            ),
            Center(
              child: AnimatedTextKit(
                animatedTexts: [
                  ColorizeAnimatedText('PROJECT',
                      textStyle: GoogleFonts.pressStart2p(fontSize: 40.0),
                      colors: [
                        Color(0xFF004D40),
                        Colors.yellow,
                        Colors.orange,
                        Colors.purple,
                        Colors.amber,
                        Colors.teal
                      ]),
                ],
                isRepeatingAnimation: true,
                repeatForever: true,
              ),
            ),
            const Divider(
              height: 20.0,
            ),
            Center(
              child: AnimatedTextKit(
                animatedTexts: [
                  RotateAnimatedText('HOPE YOU LIKE IT:)',
                      textStyle: GoogleFonts.aclonica(
                          fontSize: 20.0, fontWeight: FontWeight.w900),
                      rotateOut: false),
                ],
                totalRepeatCount: 1,
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                margin: const EdgeInsets.only(top: 200),
                height: 200,
                width: double.infinity,
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    openCheckout();
                  },
                  child: Text(
                    'RazorPay',
                    style: TextStyle(color: Colors.teal),
                  ),
                  style: ButtonStyle(
                      fixedSize:
                          MaterialStateProperty.all(Size.fromHeight(40.0)),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      side: MaterialStateProperty.all(
                        BorderSide(
                            style: BorderStyle.solid, color: Color(0xFF26A69A)),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              side: BorderSide(color: Color(0xFF26A69A))))),
                ),
              ),
            )
          ],
        ),
      )),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
                fit: FlexFit.loose,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Profile();
                    }));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 80.0,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.teal),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.person_outline_rounded,
                          size: 28.0,
                          color: Colors.white,
                        ),
                        Text(
                          phone,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                )),
            const Divider(
              height: 10.0,
              color: Color(0xFFB2DFDB),
              thickness: 10.0,
            ),
            Flexible(
              child: InkWell(
                onTap: () => print('object'),
                hoverColor: Colors.red[300],
                child: Container(
                  alignment: Alignment.center,
                  height: 60.0,
                  child: ListTile(
                      leading: Icon(
                        Icons.bookmark,
                        color: Colors.teal,
                        size: 20.0,
                      ),
                      title: Text(
                        'Order History',
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ),
            ),
            const Divider(
              height: 10.0,
              color: Color(0xFF26A69A),
              thickness: 10.0,
            ),
            Flexible(
              child: InkWell(
                onTap: () => print('object'),
                hoverColor: Colors.yellow[300],
                child: Container(
                  alignment: Alignment.center,
                  height: 60.0,
                  child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.teal,
                        size: 20.0,
                      ),
                      title: Text(
                        'Help and Support',
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ),
            ),
            const Divider(
              height: 10.0,
              color: Color(0xFFB2DFDB),
              thickness: 10.0,
            ),
            Flexible(
              child: InkWell(
                onTap: () => print('object'),
                hoverColor: Colors.purple[100],
                child: Container(
                  alignment: Alignment.center,
                  height: 60.0,
                  child: ListTile(
                      leading: Icon(
                        Icons.update,
                        color: Colors.teal,
                        size: 20.0,
                      ),
                      title: Text(
                        'Updates',
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ),
            ),
            const Divider(
              height: 10.0,
              color: Color(0xFF26A69A),
              thickness: 10.0,
            ),
            Flexible(
              child: InkWell(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MyHomePage();
                  }));
                },
                hoverColor: Colors.blue[300],
                child: Container(
                  alignment: Alignment.center,
                  height: 60.0,
                  child: ListTile(
                      leading: Icon(
                        Icons.logout,
                        color: Colors.teal,
                        size: 20.0,
                      ),
                      title: Text(
                        'Log Out',
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ),
            ),
            const Divider(
              height: 10.0,
              color: Color(0xFFB2DFDB),
              thickness: 10.0,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_OYNbdLovWVnqFm',
      'amount': 28200,
      'name': name,
      'description': 'Payment',
      'prefill': {'contact': phone, 'email': email},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {}
  }
}
