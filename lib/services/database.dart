import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_base/screens/models/coffee.dart';

class Database {

  final String uid;

  final CollectionReference coffee_info= FirebaseFirestore.instance.collection('coffee');

  Database({this.uid});

  Future Set_User_Data(String Username, int Level, String Sugar, int Strength, String CoffeeName) async
  {
     return await coffee_info.doc(uid).set({
       'Username': Username,
       'Level': Level,
       'Sugar': Sugar,
       'Strength': Strength,
       'CoffeeName': CoffeeName,
     });
  }


  // stream to update nor notify the change in the document
Stream<List<Coffee>> get coffee{
    return coffee_info.snapshots().map(Snapshot_to_list);
}

// making a list of coffee dat from a snapshot

List<Coffee> Snapshot_to_list(QuerySnapshot snapshot){

    return snapshot.docs.map((doc){
        return Coffee(
          Username: doc.data()['Username'] ?? ' ',
          Level: doc.data()['Level']?? 0,
          Sugar: doc.data()['Sugar'] ?? '0',
          Strength: doc.data()['Strength']?? 0,
          CoffeeName: doc.data()['CoffeeName'] ?? '0'
        );
    }).toList();
}

}