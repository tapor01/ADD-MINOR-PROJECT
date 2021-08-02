import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_one/home.dart';
import 'package:project_one/main.dart';
import 'package:project_one/variable.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User? user = Provider.of<User?>(context);
    print('lehar');
    print(user?.uid);
   
    if (user?.uid != null) {
      return Home();
    } else {
      return MyHomePage();
    }
  }
}
