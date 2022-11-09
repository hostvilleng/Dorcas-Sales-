// function to sieve through the list of customers


import 'package:dorcashub/general/allExports.dart';

import 'customer.dart';


List<Customer> allCustomersJsonDataToIndividualCustomerModel(
    dynamic customersJsonData) {
  Map data = customersJsonData;

  List allCustomersJsonData = data['data'];

  for (var i = 0; i < allCustomersJsonData.length; i++) {
    allCustomers.add(customerJsonDataToCustomerModel(allCustomersJsonData[i]));
  }

  return allCustomers;
}
