import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirestoreWrapperServicesInterface {
  Future<QuerySnapshot> getCollectionDocuments(String collectionName);
  Future<DocumentReference> getDocument(String docPath);
  Future<DocumentReference> createDocument(String collectionName, Map<String, dynamic> data);
  Future<DocumentReference> updateDocument(String docPath, Map<String, dynamic> data);
  Future<DocumentReference> deleteDocument(String docPath);
  Future<DocumentReference> createSubCollection(String collectionName, Map<String, dynamic> data,String docPath);
  Future<DocumentReference> getSubCollectionDocuments(String collectionName,String docPath);
}

  // Future<QuerySnapshot> getCollectionDocuments(String collectionName);
  // Future<DocumentReference> getDocument(String documentPath, String collectionName);
  // F