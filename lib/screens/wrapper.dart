
import 'package:fire_base/screens/authentication/authentication.dart';
import 'package:fire_base/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {

    final user=Provider.of<User>(context);
    print(user);
    // return either home or authenticate widget
    if(user==null){
      return Authentication();
    }
    else if(user!=null){
      return Home();
    }
  }
}
