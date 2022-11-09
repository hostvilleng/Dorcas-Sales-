// function to convert companyJsonData to User Company Model

//import 'dart:convert';

import 'package:dorcashub/general/allExports.dart';

UserCompany userCompanyJsonDataToCompanyModel(dynamic companyJsonData) {
  Map data = companyJsonData;

  return UserCompany(
      id: data['data']['id'],
      name: data['data']['name'],
      productCount: data['data']['counts']['products'],
      orderCount: data['data']['counts']['orders'],
      customerCount: data['data']['counts']['customers']
    //  employeeCount: data['data']['counts']['products']
  );
}
