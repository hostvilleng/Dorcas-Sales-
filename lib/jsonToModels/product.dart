// function to convert productJsonData to Product Model

//import 'dart:convert';

import 'package:dorcashub/general/allExports.dart';

Product productJsonDataToProductModel(dynamic productJsonData) {
  dynamic data = productJsonData;

  return Product(
      productId: data['id'],
      name: data['name'],
      description: data['description'],
      currency: data['default_currency'],
      unitPrice: int.parse(
          (data['prices']['data'][0]['unit_price']['raw']).toString().split('.')[0]),
      stockAmount: data['inventory'],
      addedOn: DateTime.parse(data['created_at']));
}

Product mainProductJsonDataToProductModel(dynamic productJsonData) {
  Map data = productJsonData;

  return Product(
      productId: data['data']['id'],
      name: data['data']['name'],
      description: data['data']['description'],
      currency: data['data']['default_currency'],
      unitPrice: int.parse(
          (data['data']['prices']['data'][0]['unit_price']['raw']).toString().split('.')[0]),
      stockAmount: data['data']['inventory'],
      addedOn: DateTime.parse(data['data']['created_at']));
}
