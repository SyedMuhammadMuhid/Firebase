import 'package:flutter/material.dart';
import 'package:fire_base/screens/models/coffee.dart';
import 'package:fire_base/screens/home/edit_form.dart';

class CoffeeTile extends StatelessWidget {

 Coffee coffee= Coffee();
   CoffeeTile({this.coffee});
  @override
  Widget build(BuildContext context) {
    //EditForm(coffeeinfo: coffee,);
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
      child: Card(
        margin: EdgeInsets.fromLTRB( 20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.brown[coffee.Strength],),
          title: Text('${coffee.CoffeeName} for ${coffee.Username}'),
          subtitle: Text("Takes ${coffee.Sugar} Sugars"),

          ),
        ),
      );
  }
}
