import 'package:dorcashub/general/allExports.dart';

class ProductCategory {

  //
  final String categoryID;
  final String categoryName;
  final List<Product> categoryProducts;

  ProductCategory({@required this.categoryID, @required this.categoryName, @required this.categoryProducts});
}