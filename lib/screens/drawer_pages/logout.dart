import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stockfare_mobile/notifiers/signup_notifier.dart';
import 'package:stockfare_mobile/screens/main_pages/common_widget/bottom_navigation.dart';
import 'package:stockfare_mobile/screens/main_pages/common_widget/loader.dart';
import 'package:stockfare_mobile/services/auth_services.dart';

class LogoutPage extends StatefulWidget {
  @override
  _LogoutPageState createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  final _formKey = GlobalKey<FormState>();
  String _error;
  String password;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  AuthServices _auth = AuthServices();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    SignupNotifier _signupNotifier = Provider.of<SignupNotifier>(context);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: loading
          ? Loading()
          : Column(
              children: <Widget>[
                SizedBox(
                  height: 150,
                ),
                Center(
                    child: Image.asset('assets/images/logo.png',
                        width: 40, height: 40)),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    'Stockfare',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                ),
                Center(
                  child: Text('Hey! Enter your password to continue',
                      style: TextStyle(
                        fontSize: 14,
                      )),
                ),
                SizedBox(
                  height: 40,
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      onChanged: (val) => setState(() {
                        password = val;
                      }),
                      validator: (input) =>
                          input.isEmpty ? "Enter your password" : null,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(12),
                        labelStyle:
                            TextStyle(color: Theme.of(context).primaryColor),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context)
                                    .focusColor
                                    .withOpacity(0.2))),
                        hintStyle: TextStyle(
                            color:
                                Theme.of(context).focusColor.withOpacity(0.7)),
                        prefixIcon: Icon(Icons.lock_open,
                            color: Theme.of(context).accentColor),
                        hintText: 'Enter password',
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context)
                                    .focusColor
                                    .withOpacity(0.2))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context)
                                    .focusColor
                                    .withOpacity(0.5))),
                      ),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                    child: Center(
                      child: Container(
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Center(
                            child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                    onTap: () async {
                      // _productServices.allProducts();

                      if (_formKey.currentState.validate()) {
                        setState(() {
                          loading = true;
                        });

                        try {
                          final result =
                              await InternetAddress.lookup('google.com');
                          if (result.isNotEmpty &&
                              result[0].rawAddress.isNotEmpty) {
                            print('connected');

                            dynamic result = await _auth.loginUsernew(
                              _signupNotifier.phone,
                              password,
                            );

                            if (result == null) {
                              setState(() {
                                loading = false;
                                _error =
                                    'Could not sign in with those credentials';
                                _displaySnackBar(context);
                              });
                            } else {
                              //This will set the profile data for the notifier so that it can move between pages

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          BottomNavigationPage()));
                            }
                          }
                        } on SocketException catch (_) {
                          print('not connected');
                          setState(() {
                            loading = false;
                            _error = 'Check your internet connection';
                            _displaySnackBar(context);
                          });
                        }
                      }
                    })
              ],
            ),
    );
  }

  _displaySnackBar(BuildContext context) {
    final snackBar = SnackBar(
        backgroundColor: Theme.of(context).primaryColor,
        content: Text(
          _error,
          style: TextStyle(color: Colors.white, fontSize: 15),
        ));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
