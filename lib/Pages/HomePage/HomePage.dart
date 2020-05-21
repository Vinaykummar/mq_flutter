import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mq_flutter/Pages/FavouritesPage/FavouritesPage.dart';
import 'package:mq_flutter/Pages/LandingPage/LandingPage.dart';
import 'package:mq_flutter/Pages/NotificationsPage/NotificationsPage.dart';
import 'package:mq_flutter/Pages/ProfilePage/ProfilePage.dart';
import 'package:mq_flutter/Pages/VisitsPage/VisitsPage.dart';
import 'package:mq_flutter/Services/Auth.dart';
import 'package:mq_flutter/Services/FirebaseService.dart';

class HomePage extends StatefulWidget {
  final Auth auth;
  HomePage({@required this.auth});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseUser firebaseUser;
  FirebaseService firebaseService = FirebaseService();
  String appbar = 'test';

  int _currentIndex = 0;




  checkUser() async {
    this.firebaseUser = await this.firebaseService.currentUser;
    setState(() {
      this.appbar = firebaseUser.email;
    });
  }

  final List<Widget> pages = [
    LandingPage(),
    VisitsPage(),
    NotificationsPage(),
    FavouritesPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    checkUser();
    return Scaffold(
      appBar: AppBar(
        title: Text(appbar),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.exit_to_app), onPressed: () async{
             await widget.auth.signinAnonymous();
          } )
        ],
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(color: Theme.of(context).primaryColor),
          unselectedLabelStyle: TextStyle(color: Colors.black),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedIconTheme:
              IconThemeData(color: Theme.of(context).primaryColor, size: 28),
          unselectedIconTheme: IconThemeData(color: Colors.grey, size: 26),
          currentIndex: this._currentIndex,
          onTap: (index) {
            setState(() {
              this._currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                activeIcon: Icon(IconData(0xED9A, fontFamily: 'boxicons')),
                icon: Icon(IconData(0xEAE0, fontFamily: 'boxicons')),
                title: Text('Home')),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.locationArrow),
                title: Text('Visits')),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.solidBell),
                title: Text('Notifications')),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.solidHeart),
                title: Text('Profile')),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.solidUser),
                title: Text('Settings'))
          ]), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
