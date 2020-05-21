import 'package:mq_flutter/Models/CustomerModel.dart';

abstract class AuthInterface {
  Future<Customer> currentUser();
  Future<Customer> signinAnonymous();
  Future<void> signoutAnonymous();
}