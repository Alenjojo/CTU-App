import 'package:flutter/material.dart';

import '../Side_bar/navigation_bloc.dart';

class ChangePasswordPage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Change Password",
        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
      ),
    );
  }
}
