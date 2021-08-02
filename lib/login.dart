import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_one/main.dart';
import 'package:project_one/service.dart';
import 'package:project_one/variable.dart';

import 'home.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Login();
}

class _Login extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final AuthService _authService = AuthService();
    final _formkey = GlobalKey<FormState>();
    var myControlleremail = TextEditingController();
    var myControllerpass = TextEditingController();
    return Scaffold(backgroundColor: Colors.tealAccent[400],
      resizeToAvoidBottomInset: false,
      body: Builder(builder: (BuildContext context) {
        return Center(
          child: Container(
            padding: const EdgeInsets.only(top: 10.0, left: 10.0),
            height: double.infinity,
            width: double.infinity,
            margin: const EdgeInsets.only(top: 80.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0))),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MyApp();
                          }));
                        },
                        child: Icon(
                          Icons.cancel,
                          color: Colors.tealAccent[400],
                        ))),
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  alignment: Alignment.center,
                  width: 90.0,
                  height: 90.0,
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.0),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.tealAccent[400],
                      borderRadius: BorderRadius.circular(100.0)),
                ),
                Container(
                  child: Form(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.width * 0.15,
                          margin: const EdgeInsets.only(top: 50.0),
                          child: TextFormField(
                            style: TextStyle(fontSize: 12.0),
                            autocorrect: true,
                            textAlign: TextAlign.left,
                            controller: myControlleremail,
                            decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(50.0)),
                                  borderSide: const BorderSide(
                                      color: Color(0xFF26A69A), width: 2.0),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(50.0)),
                                  borderSide: const BorderSide(
                                      color: Color(0xFFA7FFEB), width: 2.0),
                                ),
                                hintText: 'Enter your email',
                                hintStyle: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w900),
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.tealAccent[400],
                                  size: 18.0,
                                )),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.width * 0.15,
                          child: TextFormField(
                            style: TextStyle(fontSize: 12.0),
                            autocorrect: true,
                            obscureText: true,
                            textAlign: TextAlign.left,
                            controller: myControllerpass,
                            decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(50.0)),
                                  borderSide: const BorderSide(
                                      color: Color(0xFF26A69A), width: 2.0),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(50.0)),
                                  borderSide: const BorderSide(
                                      color: Color(0xFF26A69A), width: 2.0),
                                ),
                                hintText: 'Enter your Password',
                                hintStyle: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w900),
                                prefixIcon: Icon(
                                  Icons.password,
                                  color: Colors.tealAccent[400],
                                  size: 18.0,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width * 0.13,
                  margin: const EdgeInsets.only(top: 100.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      dynamic result = await _authService.login(
                          myControlleremail.text, myControllerpass.text);
                     if(result!=null){
                       Navigator.push(context, MaterialPageRoute(builder: (context){
                         return Home();
                       }));
                     }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please Enter Valid Email or Password'),
                          backgroundColor: Colors.teal,
                        ),
                      );
                     }
                    },
                    child: Text('LOG IN'),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.tealAccent[400]),
                        side: MaterialStateProperty.all(
                          BorderSide(
                              style: BorderStyle.solid,
                              color: Color(0xFF26A69A)),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    side:
                                        BorderSide(color: Color(0xFF26A69A))))),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}

/*Widget homee(BuildContext context) {
  final AuthService _authService = AuthService();
  final _formkey = GlobalKey<FormState>();
  var myControlleremail = TextEditingController();
  var myControllerpass = TextEditingController();
  return Scaffold(
    resizeToAvoidBottomInset: false,
    body: Builder(builder: (BuildContext context) {
      return Center(
        child: Container(
          padding: const EdgeInsets.only(top: 10.0, left: 10.0),
          height: double.infinity,
          width: double.infinity,
          margin: const EdgeInsets.only(top: 80.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0))),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MyApp();
                        }));
                      },
                      child: Icon(
                        Icons.cancel,
                        color: Colors.tealAccent[400],
                      ))),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                alignment: Alignment.center,
                width: 90.0,
                height: 90.0,
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.0),
                ),
                decoration: BoxDecoration(
                    color: Colors.tealAccent[400],
                    borderRadius: BorderRadius.circular(100.0)),
              ),
              Container(
                child: Form(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.width * 0.15,
                        margin: const EdgeInsets.only(top: 50.0),
                        child: TextFormField(
                          style: TextStyle(fontSize: 12.0),
                          autocorrect: true,
                          textAlign: TextAlign.left,
                          controller: myControlleremail,
                          decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(50.0)),
                                borderSide: const BorderSide(
                                    color: Color(0xFF26A69A), width: 2.0),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(50.0)),
                                borderSide: const BorderSide(
                                    color: Color(0xFFA7FFEB), width: 2.0),
                              ),
                              hintText: 'Enter your email',
                              hintStyle: TextStyle(
                                  fontSize: 12.0, fontWeight: FontWeight.w900),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.tealAccent[400],
                                size: 18.0,
                              )),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.width * 0.15,
                        child: TextFormField(
                          style: TextStyle(fontSize: 12.0),
                          autocorrect: true,
                          obscureText: true,
                          textAlign: TextAlign.left,
                          controller: myControllerpass,
                          decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(50.0)),
                                borderSide: const BorderSide(
                                    color: Color(0xFF26A69A), width: 2.0),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(50.0)),
                                borderSide: const BorderSide(
                                    color: Color(0xFF26A69A), width: 2.0),
                              ),
                              hintText: 'Enter your Password',
                              hintStyle: TextStyle(
                                  fontSize: 12.0, fontWeight: FontWeight.w900),
                              prefixIcon: Icon(
                                Icons.password,
                                color: Colors.tealAccent[400],
                                size: 18.0,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.width * 0.13,
                margin: const EdgeInsets.only(top: 100.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      dynamic result = await _authService.login(
                          myControlleremail.text, myControllerpass.text);
                      if (result == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text('Please Enter Valid Email or Password'),
                            backgroundColor: Colors.teal,
                          ),
                        );
                      } else {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Home();
                        }));
                      }
                    }
                  },
                  child: Text('LOG IN'),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.tealAccent[400]),
                      side: MaterialStateProperty.all(
                        BorderSide(
                            style: BorderStyle.solid, color: Color(0xFF26A69A)),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              side: BorderSide(color: Color(0xFF26A69A))))),
                ),
              )
            ],
          ),
        ),
      );
    }),
  );
}
*/
