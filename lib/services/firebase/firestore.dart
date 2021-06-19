// import 'package:cloud_firestore/cloud_firestore.dart';

// class FirestoreService {
//   FirestoreService({required this.uid});

//   final String? uid;

//   // users collection reference
//   final CollectionReference _userCollectionReference = FirebaseFirestore.instance.collection("users");

//   // user data stored
//   Future updateUserData({String? name, String? email}) async {
//     return await _userCollectionReference.doc(uid).set({"name": name, "email": email});
//   }
// }
