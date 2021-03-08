import 'package:flutter/material.dart';

import '../Side_bar/navigation_bloc.dart';

class MyProfilePage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "My Profile",
        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
      ),
    );
  }
}
