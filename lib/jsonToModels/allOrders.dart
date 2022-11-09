// function to sieve through the list of orders


import 'package:dorcashub/general/allExports.dart';

import 'order.dart';



List<Order> allOrdersJsonDataToIndividualOrderModel(
    dynamic ordersJsonData) {

  Map data = ordersJsonData;

  List allOrdersJsonData = data['data'];

  for (var i = 0; i < allOrdersJsonData.length; i++) {
    if(allOrdersJsonData[i]['id'] != 'a6c62912-630b-11ec-a0e0-06b9f3dedbdd') {

      invoices.add(orderJsonDataToOrderModel(allOrdersJsonData[i]));
      print('added $i');
      
    }
    
  }

  return invoices;
}