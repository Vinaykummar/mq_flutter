import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreApi {
  final _firestoreApi = Firestore.instance;
  Future<String>  getCollection(String args) {
    return this._getCollection(args);
  }

  Future<String>  _getCollection(String args) {
    return Future.delayed(Duration(seconds: 5), () => "hello");
  }

}