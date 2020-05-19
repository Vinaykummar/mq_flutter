import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DatabaseServices {
  Future<QuerySnapshot> getCollectionDocuments();
  Future<DocumentReference> getDocument();
  Future<DocumentReference> createDocument();
  Future<DocumentReference> updateDocument();
  Future<DocumentReference> deleteDocument();
  Future<DocumentReference> updateField();
}

  // Future<QuerySnapshot> getCollectionDocuments(String collectionName);
  // Future<DocumentReference> getDocument(String documentPath, String collectionName);
  // Future<DocumentReference> createDocument(Map<String, dynamic> data, String collectionName);
  // Future<DocumentReference> updateDocument(Map<String, dynamic> data, String collectionName);
  // Future<DocumentReference> deleteDocument(String documentPath, String collectionName);
  // Future<DocumentReference> updateField(String documentPath, String collectionName,(Map<String, dynamic> data));