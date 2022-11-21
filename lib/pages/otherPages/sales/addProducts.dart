import 'package:dorcashub/general/allExports.dart';
import 'package:dorcashub/jsonToModels/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';



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
TextEditingController(text: 'NGN:');
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
      body: Form(
       //key: _key,
      child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 60, 10, 0),
            child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 24,
                              color: Colors.black,
                            )),
                        SizedBox(
                          width: 110,
                        ),
                        Text(
                          "Add Products",
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 40),

                    //data form

                    Container(
                      constraints: BoxConstraints(maxWidth: 700),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              validator: (value) {
                                if ( _productNameController.text.isEmpty) {
                                  return "This field can't be empty";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                //hintText: "Short Description:",
                                labelText: 'Product Name:',
                                labelStyle:
                                TextStyle(fontSize: 12, color: Colors.black),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(13)),
                              ),

                              // minLines: null,
                              //maxLines: null,
                              // If this is null, there is no limit to the number of lines, and the text container will start with enough vertical space for one line and automatically grow to accommodate additional lines as they are entered.
                              //expands:
                              //true, // If
                              controller:  _productNameController,
                            ),

                            SizedBox(
                              height: 10,
                            ),

                            TextFormField(
                              validator: (value) {
                                if ( _saleCurrencyController.text.isEmpty) {
                                  return "This field can't be empty";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                //hintText: "Short Description:",
                                labelText: 'Sales Currency:',
                                labelStyle:
                                TextStyle(fontSize: 12, color: Colors.black),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(13)),
                              ),

                              // minLines: null,
                              //maxLines: null,
                              // If this is null, there is no limit to the number of lines, and the text container will start with enough vertical space for one line and automatically grow to accommodate additional lines as they are entered.
                              //expands:
                              //true, // If
                              controller:  _saleCurrencyController,
                            ),//common space

                            SizedBox(
                              height: 10,
                            ),

                            TextFormField(
                              validator: (value) {
                                if ( _productPriceController.text.isEmpty) {
                                  return "This field can't be empty";
                                } else {
                                  return null;
                                }
                              },

                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                //hintText: "Short Description:",
                                labelText: 'Unit Prices:',
                                labelStyle:
                                TextStyle(fontSize: 12, color: Colors.black),

                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(13)),

                              ),

                              // minLines: null,
                              //maxLines: null,
                              // If this is null, there is no limit to the number of lines, and the text container will start with enough vertical space for one line and automatically grow to accommodate additional lines as they are entered.
                              //expands:
                              //true, // If
                              controller:  _productPriceController,

                            ),


                          //  CommonTextFieldSmall(
                           //   controller: _productPriceController,
                            //  hintText: '',
                            //  onlyNumbers: true,
                            //),

                            SizedBox(
                              height: 10,
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

                            TextFormField(
                              validator: (value) {
                                if ( _productDescriptionController.text.isEmpty) {
                                  return "This field can't be empty";
                                } else {
                                  return null;
                                }
                              },

                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                //hintText: "Short Description:",
                                labelText: 'Product Description:',
                                labelStyle:
                                TextStyle(fontSize: 12, color: Colors.black),

                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(13)),

                              ),

                              // minLines: null,
                              //maxLines: null,
                              // If this is null, there is no limit to the number of lines, and the text container will start with enough vertical space for one line and automatically grow to accommodate additional lines as they are entered.
                              //expands:
                              //true, // If
                              controller:  _productDescriptionController,

                            ),




                            SizedBox(
                              height: 10,
                            ),

                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black54, width: 1.0),
                                  borderRadius: BorderRadius.circular(13)),
                              padding: EdgeInsets.only(right: 15, top: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: DropdownButtonHideUnderline(
                                      child: ButtonTheme(
                                        alignedDropdown: true,
                                        child: DropdownButton(
                                          items: _accountType
                                              .map((value) => DropdownMenuItem(
                                            child: Text(
                                              value,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                              ),
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
                                            style: TextStyle(color: Colors.black,
                                              fontSize: 13,),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),


                            SizedBox(
                              height: 40,
                            ),








                            //add button

                            Align(
                                alignment: Alignment.bottomCenter,
                                child: GestureDetector(
                                  onTap: () async {
                                    //if (_key.currentState.validate)
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
                )))));
  }
}
