import 'package:fire_base/services/auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Register extends StatefulWidget {
  @override
  Function changer_toggler;
  Register({this.changer_toggler});
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _key=GlobalKey<FormState>();
  AuthService _authServices= AuthService();
  @override
  bool isloading= false;
  String email=' ';
  String pass=' ';
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown[500],
          title: Text("Sign Up With Us",
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
                    SizedBox(height: 20,),
                    TextFormField(
                        validator: (val)=> val==pass ? null : 'Password Does Not Match',
                        obscureText: true,
                        onChanged: (val){
                        },
                        style: TextStyle(
                          fontFamily: 'IndieFlower',
                          color: Colors.brown[800],
                          fontSize: 25,

                        ),
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
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
                      color: Colors.brown[500],
                      onPressed: () async {
                        if(_key.currentState.validate())
                          {
                            setState(() {
                              isloading=true;
                            });
                          dynamic result=  await _authServices.SignUpwithEmailPass(email, pass);
                            if(result==null)
                              {
                                print('invalidity noted');
                              }
                          }

                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Text('Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'IndieFlower',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,)),
                    ),

                  ],
                ),
              ),

              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.brown[800], fontFamily: 'IndieFLower'),
                  children: <TextSpan>[
                    TextSpan(text: 'Previously a User? ,than '),
                    TextSpan(
                        text: 'Sign In',
                        style: TextStyle(color: Colors.lightBlue, fontFamily: 'IndieFlower'),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('I Was CLicked');
                            widget.changer_toggler();
                           // Navigator.pushNamed(context, '/signin');
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
