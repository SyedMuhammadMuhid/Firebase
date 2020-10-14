import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_base/screens/models/coffee.dart';
import 'package:fire_base/screens/models/user.dart';

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

Future Update_User_Data(String Username, int Level, String Sugar, int Strength, String CoffeeName)async{
    return await coffee_info.doc(uid).update({
      'Username': Username,
      'Level': Level,
      'Sugar': Sugar,
      'Strength': Strength,
      'CoffeeName': CoffeeName,

    });
}
Future Delete_User_Entry() async
{
  return await coffee_info.doc(uid).delete();
}






  // stream to update nor notify the change in the document
Stream<List<Coffee>> get coffee{
    return coffee_info.snapshots().map(Snapshot_to_list);
}


UserData _userDatafromSnapshot(DocumentSnapshot snapshot) {

    return UserData(
      Uid: uid,
      Username: snapshot.data()['Username'],
      Sugar: snapshot.data()['Sugar'],
      Level: snapshot.data()['Level'],
        Strength: snapshot.data()['Strength'],
        CoffeeName: snapshot.data()['CoffeeName']
    );

}
// user data stream to pre occupy the edit form and then edit and detect changes
  Stream<UserData> get userData{

    return coffee_info.doc(uid).snapshots()
        .map(_userDatafromSnapshot);
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