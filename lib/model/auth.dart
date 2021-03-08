import 'package:ctu_app/helper/Constants.dart';
import 'package:ctu_app/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:yibe_main/services/userdatabase.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserDetails _userFromFireBaseUser(User user) {
    Constants.uid = user.uid;
    return user != null ? UserDetails(uid: user.uid) : null;
  }

  Stream<UserDetails> get user {
    return _auth
        .authStateChanges()
        .map((User user) => _userFromFireBaseUser(user));
  }
}
