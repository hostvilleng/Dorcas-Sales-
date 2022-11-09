// function to convert orderJsonData to Order Model

import 'package:dorcashub/general/allExports.dart';
import 'package:dorcashub/jsonToModels/product.dart';

Order orderJsonDataToOrderModel(dynamic orderJsonData) {
  dynamic data = orderJsonData;

  

  return Order(
      invoiceId: data['id'],
      invoiceNumber: data['invoice_number'],
      invoiceTitle: data['title'],
      invoiceDescription: data['description'],
      currency: data['currency'],
      amountOrdered:
          int.parse((data['amount']['raw']).toString().split('.')[0]),
      reminderOn: data['has_reminders'],
      invoiceDueDate: data['due_at'] == null ? null: DateTime.parse(data['due_at']),
      invoiceDateCreated: DateTime.parse(data['created_at']),
      product: productJsonDataToProductModel(data['products']['data'][0]),
      customer: null,
      paidFor: data['is_quote']);
}

Order mainOrderJsonDataToOrderModel(dynamic orderJsonData) {
  Map data = orderJsonData;

  return Order(
      invoiceId: data['data']['id'],
      invoiceNumber: data['data']['invoice_number'],
      invoiceTitle: data['data']['title'],
      invoiceDescription: data['data']['description'],
      currency: data['data']['currency'],
      amountOrdered:
          int.parse((data['data']['amount']['raw']).toString().split('.')[0]),
      reminderOn: data['data']['has_reminders'],
      invoiceDueDate: data['data']['due_at'] == null ? null: DateTime.parse(data['data']['due_at']),
      invoiceDateCreated: DateTime.parse(data['data']['created_at']),
      product:
          productJsonDataToProductModel(data['data']['products']['data'][0]),
      customer: null,
      paidFor: data['data']['is_quote']);
}
