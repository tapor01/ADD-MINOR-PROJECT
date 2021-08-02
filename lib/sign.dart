import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_one/home.dart';
import 'package:project_one/main.dart';
import 'package:project_one/service.dart';

class SignIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignIn();
}

class _SignIn extends State<SignIn> {
   var myControlleremail = TextEditingController();
  var myControllerpass = TextEditingController();
  final AuthService _authService = AuthService();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.tealAccent[400],
        body: Center(
          child: Container(
            margin: const EdgeInsets.only(top: 80.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.only(top: 2.0, left: 4.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: InkWell(
                              onTap: () { Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return MyHomePage();
                            }));},
                              child: Icon(
                                Icons.cancel,
                                color: Colors.tealAccent[400],
                              )),
                        ),
                        Flexible(
                            fit: FlexFit.loose,
                            child: Container(
                              height: 90.0,
                              width: 90.0,
                              margin: const EdgeInsets.only(top: 20.0),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100.0)),
                                  color: Colors.tealAccent[400]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'REGI',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 1.0),
                                  ),
                                  Text(
                                    'STER',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 1.0),
                                  ),
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Form(
                      key: _formkey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextFormField(
                            validator: (val) =>
                                val!.isEmpty ? 'Please Enter Email' : null,
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
                                      color: Color(0xFF26A69A), width: 2.0),
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
                          TextFormField(
                            validator: (val) => val!.length < 6
                                ? 'Password should be more than 6 digit'
                                : null,
                            style: TextStyle(fontSize: 12.0),
                            autocorrect: true,
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
                          TextFormField(
                            style: TextStyle(fontSize: 12.0),
                            autocorrect: true,
                            textAlign: TextAlign.left,
                            // controller: myControlleremail,
                            decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(50.0)),
                                  borderSide: const BorderSide(
                                      color: Color(0xFF27A69A), width: 2.0),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(50.0)),
                                  borderSide: const BorderSide(
                                      color: Color(0xFF27A69A), width: 2.0),
                                ),
                                hintText: 'Enter UserName',
                                hintStyle: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w900),
                                prefixIcon: Icon(
                                  Icons.password_outlined,
                                  color: Colors.tealAccent[400],
                                  size: 18.0,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 8.0, right: 2.0),
                    width: double.infinity,
                    child: Flexible(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            dynamic result = await _authService.signin(myControlleremail.text,myControllerpass.text);
                            if(result==null){
                                ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please Enter Valid Email or Password'),
                          backgroundColor: Colors.teal,
                        ),
                      );
                            }else{
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Home();
                            }));
                            }
                            
                          }
                        },
                        child: Text('SIGN IN'),
                        style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(
                                Size.fromHeight(40.0)),
                            backgroundColor: MaterialStateProperty.all(
                                Colors.tealAccent[400]),
                            side: MaterialStateProperty.all(
                              BorderSide(
                                  style: BorderStyle.solid,
                                  color: Color(0xFF26A69A)),
                            ),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    side:
                                        BorderSide(color: Color(0xFF26A69A))))),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
