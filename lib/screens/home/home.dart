import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_base/screens/little_menu.dart';
import 'package:fire_base/screens/models/coffee.dart';
import 'package:fire_base/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:fire_base/services/database.dart';
import 'package:provider/provider.dart';
import 'package:fire_base/screens/home/coffee_list.dart';

import 'edit_form.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {

   void _showEdit()
    {
showModalBottomSheet(context: context, builder: (context){
  return Container(
    color: Colors.amber[300],
     padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
    child: EditForm(),
  );
});
    }

    void kick_me(String choice) async{
      AuthService _auth= AuthService();
      if(choice=='Sign Out'){
        await _auth.Signout();
      }
      else if(choice=='Edit'){
        _showEdit();
      }
    }



    return StreamProvider<List<Coffee>>.value(
      value: Database().coffee,
      child: Scaffold(
        backgroundColor: Colors.brown[200],
        appBar: AppBar(
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: kick_me,
              itemBuilder: (BuildContext context){
                return LittleMenu().choices.map((String choice){
                  return PopupMenuItem<String>(child:Text(choice), value: choice,);
                }).toList();
              },
            )

           // IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: Colors.white, size: 25,),),
            //IconButton(onPressed: (){}, icon: Icon(Icons.exit_to_app,color: Colors.white, size: 25,),),
          ],
          backgroundColor: Colors.brown[500],
          centerTitle: true,
          title: Text("Where's My Coffee",
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'IndieFlower',
              fontWeight: FontWeight.bold,

            ),),
        ),
        body: CoffeeList(),
      ),
    );


  }

}
