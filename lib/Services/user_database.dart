import 'package:cloud_firestore/cloud_firestore.dart';

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
}
