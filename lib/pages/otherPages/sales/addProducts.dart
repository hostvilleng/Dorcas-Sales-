import 'package:dorcashub/general/allExports.dart';
import 'package:dorcashub/jsonToModels/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



// vars for product categories section
var selectedCurrency, selectedType;

List<String> _accountType = [
  'feg',

];
//String _currentValueForProductMode = 'Add a new Product Categories';
//String _currentProductSelectedFromSelectedCategoryProducts = productCategories[0].categoryName;
TextEditingController _categoryNameController = TextEditingController();

TextEditingController _productNameController = TextEditingController();
TextEditingController _saleCurrencyController =
TextEditingController(text: 'NGN');
TextEditingController _productPriceController = TextEditingController();
TextEditingController _productDescriptionController = TextEditingController();

class AddProduct extends StatefulWidget {
  final Function refreshProductsPage;

  const AddProduct({Key key, @required this.refreshProductsPage})
      : super(key: key);
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
            child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          size: 24,
                          color: Colors.black,
                        )),

                    SizedBox(
                      height: 20,
                    ), //common space

                    CommonText(
                      text: 'Add Product',
                      size: 24,
                      color: AppColors().black,
                      bold: true,
                    ),

                    SizedBox(height: 20),

                    //data form

                    Container(
                      constraints: BoxConstraints(maxWidth: 700),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text: 'Product Name:',
                              size: 17,
                            ),
                            SizedBox(height: 12),
                            CommonTextFieldSmall(
                              controller: _productNameController,
                              hintText: 'Drink',
                            ),

                            SizedBox(
                              height: 20,
                            ), //common space

                            CommonText(
                              text: 'Sale Currency:',
                              size: 17,
                            ),
                            SizedBox(height: 12),
                            CommonTextFieldSmall(
                              controller: _saleCurrencyController,
                              hintText: '',
                              enabled: false,
                            ),

                            SizedBox(
                              height: 20,
                            ), //common space

                            CommonText(
                              text: 'Product Unit Price:',
                              size: 17,
                            ),
                            SizedBox(height: 12),
                            CommonTextFieldSmall(
                              controller: _productPriceController,
                              hintText: '',
                              onlyNumbers: true,
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            //common space

                            // CommonText(
                            //   text: 'Amount in Stock:',
                            //   size: 17,
                            // ),
                            // SizedBox(height: 12),
                            // CommonTextFieldSmall(
                            //   controller: _productAmountController,
                            //   hintText: '',
                            //   onlyNumbers: true,
                            // ),

                            // SizedBox(
                            //   height: 20,
                            // ), //common space

                            CommonText(
                              text: 'Product Description:',
                              size: 17,
                            ),
                            SizedBox(height: 12),
                            CommonTextFieldSmall(
                              controller: _productDescriptionController,
                              hintText: 'A 50cl bottle of Drink',
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            Padding(
                              padding: const EdgeInsets.only(right: 8.0, left: 8,bottom: 10),
                              child:
                                  Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                //crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  DropdownButton(
                                    items: _accountType
                                        .map((value) => DropdownMenuItem(
                                      child: Text(
                                        value,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      value: value,
                                    ))
                                        .toList(),
                                    onChanged: (selectedAccountType) {
                                      print('$selectedAccountType');
                                      setState(() {
                                        selectedType = selectedAccountType;
                                      });
                                    },
                                    value: selectedType,
                                    isExpanded: false,
                                    hint: Text(
                                      'Choose Product Category',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  )
                                ],
                                  ),

                            ),






                            //add button

                            Align(
                                alignment: Alignment.bottomCenter,
                                child: GestureDetector(
                                  onTap: () async {
                                    dynamic productJsonData =
                                    await ApiRequests().addProduct(Product(
                                      name: _productNameController.text,
                                      description:
                                      _productDescriptionController.text,
                                      currency: _saleCurrencyController.text,
                                      unitPrice:
                                      int.parse(_productPriceController.text),
                                      // stockAmount:
                                      //     int.parse(_productAmountController.text),
                                    ));

                                    allProducts.add(
                                        mainProductJsonDataToProductModel(
                                            productJsonData));

                                    //widget.refreshProductsPage();

                                    _productNameController.clear();
                                    _productPriceController.clear();
                                    // _productAmountController.clear();
                                    _productDescriptionController.clear();

                                   // Navigator.pop(context);

                                    showSnackLong(context,
                                        'Product Added Sucessfully', false);
                                  },
                                  child: CommonTextButtonBig(
                                      text: 'Save Product', textSize: 17),
                                )),

                            SizedBox(
                              height: 20,
                            ),
                          ]),
                    )
                  ],
                ))));
  }
}
