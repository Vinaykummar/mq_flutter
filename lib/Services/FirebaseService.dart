import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final firestoreService = Firestore.instance;

   Future<QuerySnapshot> getCollections(String collectionName) {
    firestoreService.collection(collectionName).getDocuments().then((value) => print(value.documents.length)).catchError((onError) => print(onError));
  }

  Future<DocumentReference> uploadDocument(
      String collectionName, Map<String, dynamic> document) {
    return this.firestoreService.collection(collectionName).add(document);
  }

  Future<DocumentReference> updateDocument(
      String collectionName, String path, Map<String, dynamic> data) {
    return this.firestoreService.document(path).updateData(data);
  }

    Future<DocumentReference> uploadSubCollection(
      String collectionName, String subCollectionName,String path, Map<String, dynamic> data) {
    return this.firestoreService.document(path).collection(subCollectionName).add(data);
  }

  Future<DocumentReference> getSubCollectionDocuments(
      String collectionName, String path, Map<String, dynamic> data) {
    return this.firestoreService.document(path).updateData(data);
  }
}
