import 'package:fire_base/screens/authentication/register.dart';
import 'package:fire_base/screens/authentication/signin.dart';
import 'package:flutter/material.dart';


class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  @override
  bool toggler=true;
  void changer_toggler()
  {
    setState(() {
      toggler= !toggler;
    });

  }
  Widget build(BuildContext context) {

    if(toggler==true)
      {
        return Container(child:SignIn(changer_toggler: changer_toggler));
      }
    else if (toggler==false){
      return Container(child:Register(changer_toggler: changer_toggler));
    }
  }
}
