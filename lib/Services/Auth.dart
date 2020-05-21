import 'package:firebase_auth/firebase_auth.dart';
import 'package:mq_flutter/Interfaces/AuthInterface.dart';
import 'package:mq_flutter/Models/CustomerModel.dart';

class Auth implements AuthInterface {
  final _firebaseAuth = FirebaseAuth.instance;

  Customer _userFromFirebase(FirebaseUser user) {
    return Customer(uid: user.uid);
  }

  @override
  Future<Customer> currentUser() async {
    final user = await _firebaseAuth.currentUser();
    return _userFromFirebase(user);
  }

  Stream<Customer> get onAuthStateChanged => this._firebaseAuth.onAuthStateChanged.map(_userFromFirebase);

  @override
  Future<Customer> signinAnonymous() async {
    final user = await _firebaseAuth.signInWithEmailAndPassword(email: 'test@test.com', password: '123456');
    return _userFromFirebase(user.user);
  }

  @override
  Future<void> signoutAnonymous() async {
    return await _firebaseAuth.signOut();
  }
}
