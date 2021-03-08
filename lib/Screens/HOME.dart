import 'package:ctu_app/Side_bar/navigation_bloc.dart';
import 'package:ctu_app/Side_bar/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(),
        child: Stack(
          children: <Widget>[
            BlocBuilder<NavigationBloc, NavigationStates>(
              builder: (context, navigationState) {
                return navigationState as Widget;
              },
            ),
            SideBar(),
          ],
        ),
      ),
    );
  }
}

// Text("Hii"),
// FlatButton(
// child: Text(
// 'Sign Out',
// style: TextStyle(fontSize: 20.0),
// ),
// color: Colors.blueAccent,
// textColor: Colors.white,
// onPressed: () {
// AuthenticationService.instance.signOut();
// Navigator.of(context)
//     .push(MaterialPageRoute(builder: (context) => LogInPage()));
// },
// ),
