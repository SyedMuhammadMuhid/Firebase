import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_base/screens/little_menu.dart';
import 'package:fire_base/screens/models/coffee.dart';
import 'package:fire_base/screens/models/user.dart';
import 'package:fire_base/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fire_base/services/database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:fire_base/screens/home/coffee_list.dart';

import 'edit_form.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FToast fToast;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }
  bool Deleted=true;
  @override
  Widget build(BuildContext context) {

    final user=Provider.of<User>(context);
    
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
      else if(choice=='Edit'&& Deleted==false){
        _showEdit();
      }
      else if(choice=='Edit'&& Deleted==true){

        Widget toast = Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: Colors.redAccent,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [

              Text("First Add A Coffee", style: TextStyle(color: Colors.white, fontFamily: 'IndieFLower',fontSize: 20),),
              SizedBox(width: 12,),
              Icon(Icons.arrow_forward,color: Colors.white,)
            ],
          ),
        );


        fToast.showToast(
          child: toast,
          gravity: ToastGravity.BOTTOM,
          toastDuration: Duration(seconds: 2),
            positionedToastBuilder: (context, child) {
              return Positioned(
                child: child,
                top: 615.0,
                left: 75.0,
              );
            }
        );
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

        floatingActionButton: FloatingActionButton(

          backgroundColor: Deleted==false? Colors.redAccent: Colors.amber,
          child: Icon(Deleted==false? Icons.delete : Icons.add),
          onPressed: (){
            setState(() {
            if(Deleted==false) {
                Deleted = !Deleted;
                Database(uid: user.uid).Delete_User_Entry();
            }
            else {
                Deleted = !Deleted;
               Database(uid: user.uid).Set_User_Data('New Coffee Freak', 0 ,'0', 100,'Capichino');
            }
  });
          },

         // style: TextStyle(color: Colors.white, fontSize: 25),),
        ),
      ),
    );


  }

}
