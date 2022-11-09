// function to convert userJsonData to User Model

//import 'dart:convert';

import 'package:dorcashub/general/allExports.dart';

import 'company.dart';

User userJsonDataToUserModel(dynamic userJsonData, dynamic companyJsonData) {

  Map data = userJsonData;

  return User(
      id: data['data']['id'],
      firstName: data['data']['firstname'],
      lastName: data['data']['lastname'],
      email: data['data']['email'],
      phoneNumber: data['data']['phone'],
      company: userCompanyJsonDataToCompanyModel(companyJsonData));
}
