import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mq_flutter/Models/CustomerModel.dart';
import 'package:mq_flutter/Pages/HomePage/HomePage.dart';
import 'package:mq_flutter/Pages/LoginPage/LoginPage.dart';
import 'package:mq_flutter/Services/Auth.dart';

class EntryPage extends StatelessWidget {
  final Auth auth;

  EntryPage({@required this.auth});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Customer>(
        stream: auth.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            Customer customer = snapshot.data;
            if (customer == null) {
              return LoginPage(
                auth: auth,
              );
            }
            return HomePage(
              auth: auth,
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
