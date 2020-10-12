import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:fire_base/screens/models/coffee.dart';
import 'package:fire_base/services/database.dart';

import 'coffee_tile.dart';

class CoffeeList extends StatefulWidget {
  @override
  _CoffeeListState createState() => _CoffeeListState();
}

class _CoffeeListState extends State<CoffeeList> {
  @override
  Widget build(BuildContext context) {
    final coffee_data=Provider.of<List<Coffee>>(context);

/*coffee_data.forEach((element) {
  print(element.Username);
  print(element.Level);
  print(element.Sugar);
  print(element.Strength);
  print(element.CoffeeName);
});*/
    return ListView.builder(
      itemCount: coffee_data.length,
        itemBuilder: (context, index){
          return CoffeeTile(coffee: coffee_data[index]);
        },

    );
  }
}
