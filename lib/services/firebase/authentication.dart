import 'package:battle_line/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // firebase auth instance
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // create firebase user object
  UserModel? _userModel(User? user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  // user auth stream
  Stream<UserModel?> get user {
    return _firebaseAuth.authStateChanges().map((User? user) => _userModel(user));
  }

  // signin with email and password
  Future signInWithEmailAndPass({required String email, required String password}) async {
    try {
      UserCredential _credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? _user = _credential.user;
      return _userModel(_user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  // register with email and password
  Future registerWithEmailAndPass({required String email, required String password}) async {
    try {
      UserCredential _credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? _user = _credential.user;

      // create new user data on firestore
      // await FirestoreService(uid: _user?.uid).updateUserData(email: email);

      return _userModel(_user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password')
        print('The password provided is too weak.');
      else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return null;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // google auth

  // sign out
  Future signOut() async {
    try {
      return _firebaseAuth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
