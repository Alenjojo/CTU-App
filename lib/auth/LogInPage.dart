import 'package:auto_size_text/auto_size_text.dart';
import 'package:ctu_app/Screens/Splash_Screen.dart';
import 'package:ctu_app/auth/SignupPage.dart';
import 'package:ctu_app/auth/snack_bar_service.dart';
import 'package:flutter/material.dart';

import 'file:///C:/Users/alenj/Desktop/ctu_app/lib/Services/auth_service.dart';
// import 'package:yibe_main/utils/constants.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(debugLabel: 'sign-in-form');
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _snackBarText;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            key: scaffoldKey,
            body: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, bottom: 40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 40),
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: AutoSizeText(
                                'Log In.',
                                style: TextStyle(
                                    fontSize: 80.0,
                                    fontWeight: FontWeight.bold),
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(labelText: 'Email'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'email cannot be empty';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _passwordController,
                        decoration:
                            const InputDecoration(labelText: 'Password'),
                        obscureText: true,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'password cannot be empty';
                          }
                          return null;
                        },
                      ),
                      Spacer(),
                      InkWell(
                        child: Container(
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: Color(0xff12ACB1),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Center(
                            child: Text(
                              'Log In',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        onTap: () async {
                          if (_formKey.currentState.validate()) {
                            _snackBarText =
                                await AuthenticationService.instance.signIn(
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                            print(_snackBarText);
                            if (_snackBarText == 'Sign In Successful') {
                              SnackBarService.instance
                                  .showSnackBar(scaffoldKey, _snackBarText);
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => SplashScreen()),
                                  ModalRoute.withName('/pageHandler'));
                            } else {
                              SnackBarService.instance
                                  .showSnackBar(scaffoldKey, _snackBarText);
                            }
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                        ),
                        child: Container(
                          height: 40.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 1.0),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
