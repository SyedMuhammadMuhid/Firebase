import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_base/screens/models/coffee.dart';
import 'package:fire_base/screens/models/user.dart';
import 'package:fire_base/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fire_base/screens/home/home.dart';
import 'package:fire_base/shared/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:fire_base/screens/home/coffee_tile.dart';
import 'package:fire_base/services/auth.dart';

class EditForm extends StatefulWidget {

  @override

  _EditFormState createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {

  final _keyEdit= GlobalKey<FormState>();
  List<String> Sugars=[ '0','1','2','3','4','5'];
  String NewCoffeeName;
  String NewUserName;
  String NewSugarQuantity;
  int NewStrength;
  int NewLevel= 0;
  DocumentSnapshot variable;
  @override

  Widget build(BuildContext context)  {
      final user=Provider.of<User>(context);
print('this is what its happening $user');

return  StreamBuilder<UserData>(
    stream: Database(uid: user.uid).userData,
    builder:(context, snapshot) {
      UserData userdata= snapshot.data;

   if(snapshot.hasData==null){

       print('this shit is null');
       return SpinKitWave();
   }
   else if(snapshot.hasData){
       print('this shit is not null ${userdata.Username}');
       return Container(

           child: Form(
               key: _keyEdit,

               child: Column(
                   children: <Widget>[
                       Center(child: Text('Edit Your Choice', style: TextStyle(
                           color: Colors.brown,
                           fontFamily: 'IndieFLower',
                           fontSize: 20),)),
                       SizedBox(height: 15,),


                       TextFormField(

                         initialValue: userdata.CoffeeName,
                           validator: (val) =>
                           val.isEmpty
                               ? 'Enter Something'
                               : null,
                           onChanged: (val) =>
                               setState(() => NewCoffeeName = val),
                           decoration: InputDecoration(
                               //labelText: 'Email',
                               fillColor: Colors.white,
                               filled: true,
                               enabledBorder: input_text_decoration_variable_for_non_focus,
                               focusedBorder: input_text_decoration_variable_for_focus,

                               labelStyle: TextStyle(
                                   fontSize: 25,
                                   fontFamily: 'IndieFlower',
                                   color: Colors.brown[500]
                               ),)
                       ),
                       Text('  for  ', style: TextStyle(color: Colors.brown,
                           fontFamily: 'IndieFLower',
                           fontSize: 20),),

                       TextFormField(

                           initialValue: userdata.Username,
                           //initialValue: coffeeinfo.Username,
                           validator: (val) =>
                           val.isEmpty
                               ? 'Enter Something'
                               : null,
                           onChanged: (val) =>
                               setState(() => NewUserName = val),
                           decoration: InputDecoration(
                               //labelText: 'Email',
                               fillColor: Colors.white,
                               filled: true,
                               enabledBorder: input_text_decoration_variable_for_non_focus,
                               focusedBorder: input_text_decoration_variable_for_focus,

                               labelStyle: TextStyle(
                                   fontSize: 25,
                                   fontFamily: 'IndieFlower',
                                   color: Colors.brown[500]
                               ),)
                       ),
                       SizedBox(height: 7,),
                       Text('Strength of Coffee', style: TextStyle(
                           color: Colors.brown,
                           fontFamily: 'IndieFLower',
                           fontSize: 20)),
                       Slider(
                           min: 100,
                           max: 900,
                           divisions: 8,
                           onChanged: (val) =>
                               setState(() => NewStrength = val.round()),
                           value: (NewStrength ??userdata.Strength).toDouble(),
                           activeColor: Colors.brown[NewStrength ?? userdata.Strength],
                           inactiveColor: Colors.brown[NewStrength ?? userdata.Strength],
                       ),
                       Row(
                           children: <Widget>[
                               // dropdown and button
                               SizedBox(width: 2,),
                               Container(width: 120,

                                   child: DropdownButtonFormField(
                                       dropdownColor: Colors.white,
                                       decoration: InputDecoration(
                                           enabledBorder: OutlineInputBorder(
                                               borderSide: BorderSide(
                                                   color: Colors.white,
                                                   width: 2))
                                       ),
                                       value: NewSugarQuantity ?? userdata.Sugar,
                                       items: Sugars.map((sug) {
                                           return DropdownMenuItem(
                                               value: sug,
                                               child: Text('$sug Sugars',));
                                       }).toList(),
                                       onChanged: (val) =>
                                           setState(() =>
                                           NewSugarQuantity = val),
                                   )),
                               SizedBox(width: 81,),
                               RaisedButton(
                                   onPressed: () {
                                       setState(() async {
                                          await Database(uid:user.uid).Update_User_Data(NewUserName ?? userdata.Username  , NewLevel ,NewSugarQuantity?? userdata.Sugar, NewStrength??userdata.Strength,NewCoffeeName?? userdata.CoffeeName);
                                          Navigator.pop(context);
                                       });

                                   },
                                   elevation: 10,
                                   padding: EdgeInsets.all(23.0),
                                   color: Colors.red,
                                   child: Text('Shake',
                                       style: TextStyle(color: Colors.white),),


                               )
                           ],
                       )


                   ],
               ),

           ),
       );
   }

      });


  }
}
