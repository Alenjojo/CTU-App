import 'package:ctu_app/Screens/HOME.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'auth/LogInPage.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // UserDetails user = Provider.of<UserDetails>(context);

    if (FirebaseAuth.instance.currentUser == null) {
      return LogInPage();
    } else {
      return Home();
    }
  }
}
