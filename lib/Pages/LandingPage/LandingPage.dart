import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:mq_flutter/Pages/LandingPage/LandingPageService.dart';
import 'package:mq_flutter/Services/FirebaseService.dart';

class LandingPage extends StatelessWidget {
  DocumentReference currentUserDoc;
  String currentUserDocPath;
  DocumentReference currentStoreDoc;
  String currentStoreDocPath;
  DocumentReference storeBookingDoc;
  String storeBookingDocPath;

  Map<String, dynamic> mockCustomer() {
    return {
      'name': faker.person.name(),
      'address': faker.address.streetAddress(),
      'zip': faker.address.zipCode(),
      'email': faker.internet.email(),
      'uuid': faker.guid.guid()
    };
  }

  Map<String, dynamic> mockStore() {
    return {
      'name': '${faker.company.name()},${faker.company.suffix()}',
      'address':
          '${faker.address.streetAddress()},${faker.address.city()},${faker.address.country()}',
      'zip': faker.address.zipCode(),
      'email': faker.internet.email(),
      'mobile': '8879956321',
      'category': 'Diagnostic',
      'location': {'latitude': 17.225252, 'longitute': 45.236892},
      'shopOpened': false,
      'icon':
          'https://images.pexels.com/photos/1089027/pexels-photo-1089027.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      'images': [
        'https://images.pexels.com/photos/2321438/pexels-photo-2321438.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        'https://images.pexels.com/photos/3213283/pexels-photo-3213283.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        'https://images.pexels.com/photos/696205/pexels-photo-696205.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        'https://images.pexels.com/photos/1833586/pexels-photo-1833586.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        'https://images.pexels.com/photos/1325735/pexels-photo-1325735.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
      ]
    };
  }

  Map<String, dynamic> mockVisit() {
    return {
      'date': faker.date.dateTime(),
      'tokenNo': '26',
      'status': 'Visit Completed',
      'waitingTime': 56,
      'approxTime': faker.date.dateTime(),
      'store': mockStore()
    };
  }

  Map<String, dynamic> mockBooking() {
    return {
      'date': faker.date.dateTime(),
      'currentToken': 11,
      'waitingTime': 20,
      'customer': 12,
      'maxCustomers': 33,
      'acceptCustomers': true,
      'customMsg': 'a short Delay'
    };
  }

  final landingPageServices = LandingPageServices();

  void _getStores() async {
    var userColl = await landingPageServices.getDocuments('customers');
    print(userColl.documents.length);
  }

  void _createUser() async {
    this.currentUserDoc =
        await landingPageServices.uploadDocument('customers', mockCustomer());
    this.currentUserDocPath = this.currentUserDoc.path;
    print(this.currentUserDocPath);
  }

  void _createStore() async {
    this.currentStoreDoc =
        await landingPageServices.uploadDocument('stores', mockStore());
    this.currentStoreDocPath = this.currentStoreDoc.path;
    print(this.currentStoreDocPath);
  }

  void _createVisit() async {
    print(this.currentUserDocPath);
    var userDoc = await landingPageServices.uploadToSubCollection(
        'customer', 'visits', this.currentUserDocPath, mockVisit());
    print(userDoc.documentID);
    this._uploadCustomerToBoking();
  }

  void _startBooking() async {
    print(this.currentStoreDocPath);
    this.storeBookingDoc = await landingPageServices.uploadToSubCollection(
        'stores', 'bookings', this.currentStoreDocPath, mockBooking());
    this.storeBookingDocPath = this.storeBookingDoc.path;
    print(this.storeBookingDocPath);
  }

  void _uploadCustomerToBoking() async {
    print(this.storeBookingDocPath);
    var userDoc = await landingPageServices.uploadToSubCollection(
        'stores', 'customers', this.storeBookingDocPath, mockCustomer());
    print(userDoc.documentID);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          onPressed: _getStores,
          child: Text('Get Stores'),
        ),
        RaisedButton(
          onPressed: _createUser,
          child: Text('Create Customer'),
        ),
        RaisedButton(
          onPressed: _createStore,
          child: Text('Create Store'),
        ),
        RaisedButton(
          onPressed: _createVisit,
          child: Text('Create Visit'),
        ),
        RaisedButton(
          onPressed: _startBooking,
          child: Text('Start Booking'),
        ),
      ],
    );
  }
}
