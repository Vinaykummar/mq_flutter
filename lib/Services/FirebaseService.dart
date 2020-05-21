import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final Firestore _firestoreService = Firestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser>  get currentUser =>  _getCurrentUser();
  

   Future<FirebaseUser> _getCurrentUser() {
     return _auth.currentUser();
   }

  
  Stream<FirebaseUser> authStream () {
    return this._auth.onAuthStateChanged;
  }

   Future<QuerySnapshot> getCollections(String collectionName) {
    _firestoreService.collection(collectionName).getDocuments().then((value) => print(value.documents.length)).catchError((onError) => print(onError));
  }

  Future<DocumentReference> uploadDocument(
      String collectionName, Map<String, dynamic> document) {
    return this._firestoreService.collection(collectionName).add(document);
  }

  Future<DocumentReference> updateDocument(
      String collectionName, String path, Map<String, dynamic> data) {
    return this._firestoreService.document(path).updateData(data);
  }

    Future<DocumentReference> uploadSubCollection(
      String collectionName, String subCollectionName,String path, Map<String, dynamic> data) {
    return this._firestoreService.document(path).collection(subCollectionName).add(data);
  }

  Future<DocumentReference> getSubCollectionDocuments(
      String collectionName, String path, Map<String, dynamic> data) {
    return this._firestoreService.document(path).updateData(data);
  }

  Future<AuthResult> signinWithEmailAndPassword() {
   return _auth.signInWithEmailAndPassword(email: 'test@test.com', password: '123456');
  }
    Future<void> signout() {
   return _auth.signOut();
  }
}
