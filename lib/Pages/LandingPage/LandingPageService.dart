import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faker/faker.dart';
import 'package:mq_flutter/Interfaces/databaseServices.dart';
import 'package:mq_flutter/Services/FirebaseService.dart';

class LandingPageServices {
  FirebaseService firebaseService = FirebaseService();

  Future<QuerySnapshot> getDocuments(String collectionName) async {
    try {
      var docs = await firebaseService.getCollections(collectionName);
      return docs;
    } catch (e) {
      return e;
    }
  }

  Future<DocumentReference> uploadDocument(
      String collectionName, Map<String, dynamic> data) async {
    try {
      var doc = await firebaseService.uploadDocument(collectionName, data);
      return doc;
    } catch (e) {
      return e;
    }
  }

  Future<DocumentReference> uploadToSubCollection(
       String collectionName, String subCollectionName,String path, Map<String, dynamic> data) async {
    try {
      var doc = await firebaseService.uploadSubCollection(collectionName, subCollectionName,path,data);
      return doc;
    } catch (e) {
      return e;
    }
  }

  Future<DocumentReference> updateDocument(
      String collectionName, String path, Map<String, dynamic> data) async {
    try {
      var doc = await firebaseService.updateDocument(collectionName, path, data);
      return doc;
    } catch (e) {
      return e;
    }
  }
}
