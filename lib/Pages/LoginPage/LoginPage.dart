import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mq_flutter/Models/CustomerModel.dart';
import 'package:mq_flutter/Pages/LandingPage/LandingPageService.dart';
import 'package:mq_flutter/Services/Auth.dart';

class LoginPage extends StatelessWidget {
  final Auth auth;

  LoginPage({ @required this.auth});

  final landingPageServices = LandingPageServices();

  void _signInEmail() async {
    try {
      final customer =
          await this.auth.signinAnonymous();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginPage'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: _signInEmail,
            child: Text('Signin'),
          ),
        ],
      ),
    );
  }
}
