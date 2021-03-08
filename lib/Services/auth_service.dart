import 'package:ctu_app/Services/user_database.dart';
import 'package:ctu_app/helper/Constants.dart';
import 'package:ctu_app/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  static AuthenticationService instance = AuthenticationService();
  static UserModel pvtUserMap = UserModel();
  FirebaseAuth _firebaseAuth;

  AuthenticationService() {
    _firebaseAuth = FirebaseAuth.instance;
  }

  Future<String> signUp(
      {String email, String password, String fullName, String userName}) async {
    try {
      User user = (await _firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;

      // await user
      //     .updateProfile(displayName: fullName)
      //     .then((value) => passPvtUserInfoToDb(user, fullName, userName));

      await user
          .updateProfile(displayName: fullName)
          .then((value) => UserInfoToDb(user, fullName, userName, email));

      if (!user.emailVerified) {
        await user.sendEmailVerification();
      }
      AuthenticationService.instance
          .signOut(); //make current user null so that even if user does not verify email he wont be signed in
      return ('Sign up successful. Verify your email address to sign in');
    } on FirebaseAuthException catch (e) {
      return (e.message);
    }
  }

  Future<String> signIn({String email, String password}) async {
    try {
      if ((await _firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password)) !=
          null) {
        final User user = _firebaseAuth.currentUser;
        Constants.uid = user.uid;

        if (user.emailVerified) {
          // await DatabaseService.instance
          //     .getPvtCurrentUserInfo(user.uid)
          //     .then((value) => setSP(user, value['profId'], value['username']));
          return 'Sign In Successful';
        } else {
          return 'Verify your email first';
        }
      }
    } on FirebaseAuthException catch (e) {
      return (e.message);
    }
  }

  Future<String> signOut() async {
    await _firebaseAuth.signOut();
    // ignore: unnecessary_statements
    Constants.uid == null;
    return null;
  }

  void UserInfoToDb(
      User user, String fullName, String userName, String email) async {
    pvtUserMap = UserModel(
        fullname: fullName,
        username: userName,
        emailId: email,
        profimg: "https://picsum.photos/200/300",
        profId: user.uid);
    await DatabaseService.instance
        .createPvtUserInDB(pvtUserMap.toMap(pvtUserMap), user.uid);
  }
}
