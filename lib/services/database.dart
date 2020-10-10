import 'package:cloud_firestore/cloud_firestore.dart';

class Database {

  final String uid;

  final CollectionReference coffee_info= FirebaseFirestore.instance.collection('coffee');

  Database({this.uid});

  Future Set_User_Data(String Username, int Level, String Sugar, int Strength) async
  {
     return await coffee_info.doc(uid).set({
       'Username': Username,
       'Level': Level,
       'Sugar': Sugar,
       'Strength': Strength,
     });
  }


  // stream to update nor notify the change in the document
Stream<QuerySnapshot> get coffee{
    return coffee_info.snapshots();
}

}