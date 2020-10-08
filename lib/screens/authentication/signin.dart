import 'package:fire_base/screens/authentication/authentication.dart';
import 'package:fire_base/screens/authentication/register.dart';
import 'package:fire_base/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';


class SignIn extends StatefulWidget {
  @override
  Function changer_toggler;
  SignIn({this.changer_toggler});
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService= AuthService();
  final _key= GlobalKey<FormState>();
  @override
  bool isloading= false;
  String email=' ';
  String pass=' ';
  Widget build(BuildContext context) {
    final user=Provider.of<User>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[500],
        title: Text("Where's My Coffee",
        style: TextStyle(
            fontSize: 25,
          fontFamily: 'IndieFlower',
          fontWeight: FontWeight.bold,

        ),),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children:[
            Form(
              key: _key,
              child: Column(
                children: [
                  TextFormField(
                    validator: (val)=> val.isEmpty ? 'Enter Email': null,
                    onChanged: (val){
                      setState(() {
                        email=val;
                      });
                    },
                    style: TextStyle(
                      fontFamily: 'IndieFlower',
                      color: Colors.brown[800],
                      fontSize: 25,
                    ),
                    decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                    fontSize: 25,
                    fontFamily: 'IndieFlower',
                        color: Colors.brown[500]
                    ),)
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    validator: (val)=> val.length <6 ? 'Password Length': null,
                    obscureText: true,
                    onChanged: (val){
                      setState(() {
                        pass=val;
                      });
                    },
                    style: TextStyle(
                        fontFamily: 'IndieFlower',
                        color: Colors.brown[800],
                        fontSize: 25,

                  ),
                        decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                     fontSize: 25,
                                     fontFamily: 'IndieFlower',
                                     color: Colors.brown[500]
                                 ),)),
                ],
              ),
            ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                color: Colors.brown[200],
                onPressed: () async {
                  if(_key.currentState.validate()){
                    setState(() {
                      isloading=true;
                    });
                   dynamic result= await _authService.SignInwithEmailPass(email, pass);
                   if( result ==null){
                      print('invalidity occured while signing in');
                   }
                  }

                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Text('Sign In',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'IndieFlower',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,)),
              ),
              SizedBox(width: 15,),
              RaisedButton.icon(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
                onPressed: () async{

                      setState(() {
                        isloading=true;
                      });


                  dynamic result= await _authService.SigninAnon();
                  if(result == null){
                    print('error, the anonymous sign in failed');
                  }
                  else{
                    print('the anonymous sign in passed');
                    print (result.uid);
                  }
                },
                icon: Icon(Icons.tag_faces, size: 28,color: Colors.white,),
                label:  Text('Go Anonymous',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'IndieFlower',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
                  color: Colors.brown[800],

              ),
            ],
          ),
        ),

            RichText(
            text: TextSpan(
    style: TextStyle(color: Colors.brown[800], fontFamily: 'IndieFLower'),
    children: <TextSpan>[
    TextSpan(text: 'Not a User? ,than '),
    TextSpan(
    text: 'Register',
    style: TextStyle(color: Colors.lightBlue, fontFamily: 'IndieFlower'),
    recognizer: TapGestureRecognizer()
    ..onTap = () {
    print('I Was CLicked');
    widget.changer_toggler();

   // Navigator.pushNamed(context, '/signup');
    }),
    ],
    ),
    ),
        SizedBox(height:15),
        isloading ? SpinKitWave(color: Colors.brown[500], size: 50,): SizedBox(height: 50)],
        ),
      )

    );
  }
}
