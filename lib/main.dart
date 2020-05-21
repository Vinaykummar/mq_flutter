import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:faker/faker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mq_flutter/Pages/EntryPage/EntryPage.dart';
import 'package:mq_flutter/Pages/FavouritesPage/FavouritesPage.dart';
import 'package:mq_flutter/Pages/HomePage/HomePage.dart';
import 'package:mq_flutter/Pages/LandingPage/LandingPage.dart';
import 'package:mq_flutter/Pages/NotificationsPage/NotificationsPage.dart';
import 'package:mq_flutter/Pages/ProfilePage/ProfilePage.dart';
import 'package:mq_flutter/Pages/VisitsPage/VisitsPage.dart';
import 'package:mq_flutter/Services/Auth.dart';
import 'package:mq_flutter/Services/FirebaseService.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: EntryPage(auth: Auth()),
    );
  }
}







