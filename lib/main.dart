import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:faker/faker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mq_flutter/Pages/FavouritesPage/FavouritesPage.dart';
import 'package:mq_flutter/Pages/LandingPage/LandingPage.dart';
import 'package:mq_flutter/Pages/NotificationsPage/NotificationsPage.dart';
import 'package:mq_flutter/Pages/ProfilePage/ProfilePage.dart';
import 'package:mq_flutter/Pages/VisitsPage/VisitsPage.dart';
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> pages = [
      LandingPage(),
      VisitsPage(),
      NotificationsPage(),
      FavouritesPage(),
      ProfilePage()

  ];

  @override
  Widget build(BuildContext context) {
    final faker = new Faker();

    print(faker.person.firstName());

    return Scaffold(
  
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(color: Theme.of(context).primaryColor),
          unselectedLabelStyle: TextStyle(color: Colors.black),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedIconTheme:
              IconThemeData(color: Theme.of(context).primaryColor, size: 28),
          unselectedIconTheme: IconThemeData(color: Colors.black),
          currentIndex: this._currentIndex,
          onTap: (index) {
            setState(() {
              this._currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.fire),
                title: Text('Home')),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.locationArrow), title: Text('Visits')),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.solidBell), title: Text('Notifications')),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.solidHeart), title: Text('Profile')),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.solidUser), title: Text('Settings'))
          ]), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}







