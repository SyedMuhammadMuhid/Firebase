
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _auth= FirebaseAuth.instance;

  // auth user stream
  Stream <User> get user{
    return _auth.authStateChanges();
  }
  // sign in anonomusly

Future SigninAnon() async {
  try{
  UserCredential result= await _auth.signInAnonymously();
  User user= result.user;
  return user;
  }
  catch(e){
    print(e.toString());
    return null;
  }

}
Future SignUpwithEmailPass(String email, String pass) async{
    try{
     UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: pass);
     User user= result.user;
     return user;
    }
    catch(e){
      print('$e, an error in signing up');
      return null;
    }
}
Future SignInwithEmailPass(String email, String pass) async
{
 try {
   UserCredential result = await _auth.signInWithEmailAndPassword(
       email: email, password: pass);
   User user = result.user;
   return user;
 }
  catch(e){
    print('$e, an error in signing in');
    return null;
}
}

Future Signout() async{
    try{
      return await _auth.signOut();
    }
    catch(e){
      print('error $e, when Signing out');
      return null;
    }
}

  // sign up with email and password
  // sign in with email and password
  // sign out
}