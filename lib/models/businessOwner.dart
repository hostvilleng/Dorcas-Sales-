import 'package:dorcashub/general/allExports.dart';

class User {

  //
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final UserCompany company;
  
  final DateTime addedOn;

  //
  final String noteAbout;
  final String password;
  final String authToken;
  final String refreshToken;


  User({ this.id, @required this.firstName, @required this.lastName, @required this.email, @required this.phoneNumber, @required this.company, this.addedOn, this.noteAbout, this.password, this.authToken, this.refreshToken, });

}


class UserCompany {
  
  final String id;
  final String name;
  final int customerCount;
  final int productCount;
  final int orderCount;

  UserCompany({ this.id, @required this.name, @required this.productCount, @required this.orderCount, @required this.customerCount, employeeCount});

}