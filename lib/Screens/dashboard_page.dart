import 'package:flutter/material.dart';

import '../Side_bar/navigation_bloc.dart';

class DashBoardPage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Dashboard",
        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
      ),
    );
  }
}
