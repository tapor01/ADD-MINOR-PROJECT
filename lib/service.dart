import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_one/variable.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//sign in method
//log in method
//log out
  UserData? _userFromFireBaseUser(User user) {
    return UserData(uid: user.uid);
  }

  Stream<User?> get user {
    return FirebaseAuth.instance.authStateChanges();
  }

  Future signInAnon() async {
    try {
      UserCredential result = await _firebaseAuth.signInAnonymously();
      User? user = result.user;
      return _userFromFireBaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signin(String useremail, String pass) async {
    try {
      print(useremail);
      print(pass);
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: useremail,
        password: pass,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future login(String email, String password) async {
    try {
      print(email);
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
