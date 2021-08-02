import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_one/variable.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Profile();
}

class _Profile extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.teal[100],
    appBar: AppBar(title: Text('Account',style: TextStyle(fontSize: 28.0),),backgroundColor: Colors.teal,),
    body: Center(
      child: Container(
        height: double.infinity,
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.only(top:40.0),
        child: Column(
           children: [
             Container(
                  child:
                  Column(
                    children: [
                      Icon(Icons.person_outline_outlined,size: 70.0,color: Colors.teal),
                      Text(phone),
                  
                    ],
                  ),
                  
              )
              
          ],
        
        ),
      ),
      

      ),
    ),
    );
  }
}
