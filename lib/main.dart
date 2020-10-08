import 'package:fire_base/screens/authentication/register.dart';
import 'package:fire_base/screens/authentication/signin.dart';
import 'package:fire_base/screens/home/home.dart';
import 'package:fire_base/screens/wrapper.dart';
import 'package:fire_base/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(StreamProvider<User>.value(
      value: AuthService().user,
      child:MaterialApp(
    home: Main(),
        /*routes: {
      '/signin': (context)=> SignIn(),
          '/signup': (context)=> Register(),
        },*/

  )));
}

class Main extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    //return Wrapper();

    return Wrapper();
  }
}
