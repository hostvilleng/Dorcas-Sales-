import 'package:dorcashub/general/allExports.dart';

class Product {

  //
  final String productId;
  final String name;
  final String description;
  final String currency;
  final int unitPrice;
  final int stockAmount;
  final DateTime addedOn;


  Product({this.productId, @required this.name, @required this.description, @required this.currency, @required this.unitPrice,  this.stockAmount, this.addedOn,});
}