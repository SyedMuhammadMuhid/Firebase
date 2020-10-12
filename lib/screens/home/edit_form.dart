import 'package:flutter/material.dart';
import 'package:fire_base/screens/home/home.dart';
import 'package:fire_base/shared/constants.dart';

class EditForm extends StatefulWidget {
  @override
  _EditFormState createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  final _keyEdit= GlobalKey<FormState>();
  List<String> Sugars=[ '0','1','2','3','4','5'];
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Form(
        key: _keyEdit,

        child: Column(
          children: <Widget>[
            Center(child:Text('Edit Your Choice', style: TextStyle(color: Colors.brown,fontFamily:'IndieFLower', fontSize:30 ),)),
          SizedBox(height: 20,),


          TextFormField(
              validator: (val)=> val.isEmpty ? 'Enter Something': null,
            decoration: InputDecoration(
              //labelText: 'Email',
              fillColor: Colors.white,
              filled: true,
              enabledBorder: input_text_decoration_variable_for_non_focus,
              focusedBorder:input_text_decoration_variable_for_focus,

              labelStyle: TextStyle(
                  fontSize: 25,
                  fontFamily: 'IndieFlower',
                  color: Colors.brown[500]
              ),)
          ),
          Text('  for  ', style: TextStyle(color: Colors.brown,fontFamily:'IndieFLower', fontSize:20 ),),

            TextFormField(
                validator: (val)=> val.isEmpty ? 'Enter Something': null,
                decoration: InputDecoration(
                  //labelText: 'Email',
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: input_text_decoration_variable_for_non_focus,
                  focusedBorder:input_text_decoration_variable_for_focus,

                  labelStyle: TextStyle(
                      fontSize: 25,
                      fontFamily: 'IndieFlower',
                      color: Colors.brown[500]
                  ),)
            ),



          ],
        ),

      ),
    );
  }
}
