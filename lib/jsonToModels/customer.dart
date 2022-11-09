// function to convert customerJsonData to  Customer Model

import 'package:dorcashub/general/allExports.dart';


Customer customerJsonDataToCustomerModel(dynamic customerJsonData) {
  dynamic data = customerJsonData;

  return Customer(
      customerId: data['id'],
      firstName: data['firstname'],
      lastName: data['lastname'],
      email: data['email'],
      phoneNumber: data['phone'],
      addedOn: DateTime.parse(data['created_at']));
}

Customer mainCustomerJsonDataToCustomerModel(dynamic customerJsonData) {
   Map data = customerJsonData;

  return Customer(
      customerId: data['data']['id'],
      firstName: data['data']['firstname'],
      lastName: data['data']['lastname'],
      email: data['data']['email'],
      phoneNumber: data['data']['phone'],
      addedOn: DateTime.parse(data['data']['created_at']));
}

