import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mq_flutter/Interfaces/FirestoreWrapperServicesInterface.dart';
import 'package:mq_flutter/Services/FirestoreApi.dart';

class FirestoreWrapper implements FirestoreWrapperServicesInterface {


  final firestoreApi = FirestoreApi();


  @override
  Future<DocumentReference> createDocument(String collectionName, Map<String, dynamic> data) {
    // TODO: implement createDocument
  }

  @override
  Future<DocumentReference> createSubCollection(String collectionName, Map<String, dynamic> data, String docPath) {
    // TODO: implement createSubCollection
    throw UnimplementedError();
  }

  @override
  Future<DocumentReference> deleteDocument(String docPath) {
    // TODO: implement deleteDocument
    throw UnimplementedError();
  }

  @override
  Future<QuerySnapshot> getCollectionDocuments(String collectionName) {
    // TODO: implement getCollectionDocuments
    throw UnimplementedError();
  }

  @override
  Future<DocumentReference> getDocument(String docPath) {
    // TODO: implement getDocument
    throw UnimplementedError();
  }

  @override
  Future<DocumentReference> getSubCollectionDocuments(String collectionName, String docPath) {
    // TODO: implement getSubCollectionDocuments
    throw UnimplementedError();
  }

  @override
  Future<DocumentReference> updateDocument(String docPath, Map<String, dynamic> data) {
    // TODO: implement updateDocument
    throw UnimplementedError();
  }

}

