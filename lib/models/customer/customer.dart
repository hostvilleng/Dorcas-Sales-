import 'package:dorcashub/general/allExports.dart';

class Customer {

  //
  final String customerId;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final DateTime addedOn;

  //
  final String noteAbout;

  Customer({this.customerId, @required this.firstName, @required this.lastName, @required this.email, @required this.phoneNumber, @required this.addedOn, this.noteAbout});

}