import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  static DatabaseService instance = DatabaseService();
  FirebaseFirestore _db;

  DatabaseService() {
    _db = FirebaseFirestore.instance;
  }

  Future<void> createPvtUserInDB(Map pvtUserMap, String userId) async {
    try {
      await _db.collection("Users").doc(userId).set(pvtUserMap);
    } catch (e) {
      print(e);
    }
  }

  Future<void> cr(String userId) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection("users").doc(firebaseUser.uid).set({
      "name": "john",
      "age": 50,
      "email": "example@example.com",
      "address": {"street": "street 24", "city": "new york"}
    }).then((_) {
      print("success!");
    });
  }
}
