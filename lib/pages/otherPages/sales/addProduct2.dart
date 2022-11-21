import 'package:dorcashub/general/allExports.dart';
import 'package:dorcashub/jsonToModels/customer.dart';
import 'package:dorcashub/jsonToModels/order.dart';
import 'package:dorcashub/jsonToModels/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

// vars for new order
TextEditingController _invoiceTitleController = TextEditingController();
TextEditingController _invoiceDescriptionController = TextEditingController();
TextEditingController _currencyController = TextEditingController(text: 'NGN');
TextEditingController _totalAmountController = TextEditingController();
TextEditingController _invoiceDueDateController = TextEditingController();

//DateTime invoiceDueDate = DateTime.now();
//bool _invoiceReminderValue = false;


String _currentValueForProductMode = 'Add a new Product';
String _currentProductSelectedFromProductList = allProducts[0].name;

TextEditingController _productNameController = TextEditingController();
TextEditingController _saleCurrencyController = TextEditingController(text: 'NGN');
TextEditingController _productPriceController = TextEditingController();
TextEditingController _productDescriptionController = TextEditingController();

class AddProduct extends StatefulWidget {
  final Function refreshProductsPage;

  const AddProduct({Key key, @required this.refreshProductsPage}) : super(key: key);

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

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonText(
                          text: 'Add Product',
                          size: 24,
                          color: AppColors().black,
                          bold: true,
                        ),
                      ],
                    ),

                    SizedBox(height: 20),

                    //data form

                    Container(
                      constraints: BoxConstraints(maxWidth: 700),

                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0, left: 8,bottom: 10),
                              child: Container(
                                height: 40,

                                child: TextFormField(

                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    //hintText: "Short Description:",
                                    labelText: 'Title:',
                                    labelStyle: TextStyle(fontSize: 12,color: Colors.blueAccent),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(13)
                                    ),
                                  ),

                                  // minLines: null,
                                  //maxLines: null,
                                  // If this is null, there is no limit to the number of lines, and the text container will start with enough vertical space for one line and automatically grow to accommodate additional lines as they are entered.
                                  //expands:
                                  //true, // If
                                  controller: _invoiceTitleController,
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 5,
                            ), //common space
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0, left: 8,bottom: 10),
                              child: Container(
                                height: 500 * 0.12,
                                child: TextFormField(
                                  textInputAction: TextInputAction.newline,
                                  keyboardType: TextInputType.multiline,
                                  decoration: InputDecoration(
                                    //hintText: "Short Description:",
                                    labelText: 'Short Description :',
                                    labelStyle: TextStyle(fontSize: 12,color: Colors.blueAccent),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(13)
                                    ),
                                  ),

                                  // minLines: null,
                                  //maxLines: null,
                                  // If this is null, there is no limit to the number of lines, and the text container will start with enough vertical space for one line and automatically grow to accommodate additional lines as they are entered.
                                  //expands:
                                  //true, // If
                                  controller: _invoiceDescriptionController,
                                ),
                              ),
                            ),




                            SizedBox(
                              height: 15,
                            ), //common space
                            //product mode

                            Padding(
                              padding: const EdgeInsets.only(right: 8.0, left: 8,bottom: 10),
                              child: allProducts.length > 0
                                  ? Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonText(
                                    text: 'Product Mode:',
                                    size: 17,
                                  ),
                                  SizedBox(height: 12),
                                  CommonDropDown(
                                      options: [
                                        'Select from Products List',
                                        'Add a new Product'
                                      ],
                                      currentValue: _currentValueForProductMode,
                                      onChanged: (v) {
                                        setState(() {
                                          _currentValueForProductMode = v;

                                          //if the person is selecting a product, fill the product form fields with the details of the product (to handle error handling)
                                          if (_currentValueForProductMode ==
                                              'Select from Products List') {
                                            Product product =
                                            allProducts.firstWhere((p) =>
                                            p.name ==
                                                _currentProductSelectedFromProductList);

                                            _productNameController.text =
                                                product.name;

                                            _saleCurrencyController =
                                                TextEditingController(
                                                    text: 'NGN');
                                            _productPriceController.text =
                                                product.unitPrice.toString();

                                            _productDescriptionController.text =
                                                product.description;
                                          } else if (_currentValueForProductMode ==
                                              'Add a new Product') {
                                            //clear all the fields (so the new values can be placed in)

                                            _productNameController.clear();

                                            _saleCurrencyController =
                                                TextEditingController(
                                                    text: 'NGN');
                                            _productPriceController.clear();

                                            _productDescriptionController
                                                .clear();
                                          }
                                        });
                                      }),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              )
                                  : Container(),
                            ),

                            _currentValueForProductMode ==
                                'Select from Products List'
                                ? Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonText(
                                  text:
                                  'Select the Product that was Ordered:',
                                  size: 17,
                                ),
                                SizedBox(height: 12),
                                CommonDropDown(
                                    options: allProducts.map((product) {
                                      return product.name;
                                    }).toList(),
                                    currentValue:
                                    _currentProductSelectedFromProductList,
                                    onChanged: (v) {
                                      setState(() {
                                        _currentProductSelectedFromProductList =
                                            v;
                                      });
                                    }),
                              ],
                            )
                                : Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0, left: 8,bottom: 10),
                                    child: Container(
                                      height: 40,

                                      child: TextFormField(

                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          //hintText: "Short Description:",
                                          labelText: 'Product Name:',
                                          labelStyle: TextStyle(fontSize: 12,color: Colors.blueAccent),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(13)
                                          ),
                                        ),

                                        // minLines: null,
                                        //maxLines: null,
                                        // If this is null, there is no limit to the number of lines, and the text container will start with enough vertical space for one line and automatically grow to accommodate additional lines as they are entered.
                                        //expands:
                                        //true, // If
                                        controller: _productNameController,
                                      ),
                                    ),
                                  ),//common space

                                  SizedBox(
                                    height: 5,
                                  ), //common space
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0, left: 8,bottom: 10),
                                    child: Container(
                                      height: 40,

                                      child: TextFormField(

                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          //hintText: "Short Description:",
                                          labelText: 'Product Unit Price:',
                                          labelStyle: TextStyle(fontSize: 12,color: Colors.blueAccent),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(13)
                                          ),
                                        ),

                                        // minLines: null,
                                        //maxLines: null,
                                        // If this is null, there is no limit to the number of lines, and the text container will start with enough vertical space for one line and automatically grow to accommodate additional lines as they are entered.
                                        //expands:
                                        //true, // If
                                        controller: _productPriceController,
                                      ),
                                    ),
                                  ),//common space
                                  SizedBox(
                                    height: 5,
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0, left: 8,bottom: 10),
                                    child: Container(
                                      height: 500 * 0.12,
                                      child: TextFormField(
                                        textInputAction: TextInputAction.newline,
                                        keyboardType: TextInputType.multiline,
                                        decoration: InputDecoration(
                                          //hintText: "Short Description:",
                                          labelText: 'Product Description:',
                                          labelStyle: TextStyle(fontSize: 12,color: Colors.blueAccent),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(13)
                                          ),
                                        ),

                                        // minLines: null,
                                        //maxLines: null,
                                        // If this is null, there is no limit to the number of lines, and the text container will start with enough vertical space for one line and automatically grow to accommodate additional lines as they are entered.
                                        //expands:
                                        //true, // If
                                        controller: _productDescriptionController,
                                      ),
                                    ),
                                  ),


                                ]),

                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0, left: 8,bottom: 10),
                              child: Container(
                                height: 40,

                                child: TextFormField(

                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    //hintText: "Short Description:",
                                    labelText: 'How many unit were ordered?:',
                                    labelStyle: TextStyle(fontSize: 12,color: Colors.blueAccent),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(13)
                                    ),
                                  ),

                                  // minLines: null,
                                  //maxLines: null,
                                  // If this is null, there is no limit to the number of lines, and the text container will start with enough vertical space for one line and automatically grow to accommodate additional lines as they are entered.
                                  //expands:
                                  //true, // If
                                  controller: _totalAmountController,
                                ),
                              ),
                            ),//common space


                            SizedBox(
                              height: 10,
                            ), //common space




                            //common space


                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 2,
                              child: Padding(
                                padding: const EdgeInsets.only( left: 8,),
                                child: CommonTextFieldSmall(
                                  controller: _saleCurrencyController,
                                  hintText: '',
                                  enabled: false,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0, left: 8,bottom: 10),
                              child: Container(
                                width: 2,
                                child: CommonTextFieldSmall(
                                  controller: _currencyController,
                                  enabled: false,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),


                            //add button

                            Align(
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: () async{
                                    if (_productNameController.text.isNotEmpty &&
                                        _saleCurrencyController.text.isNotEmpty &&
                                        _productPriceController.text.isNotEmpty &&
                                        _productDescriptionController
                                            .text.isNotEmpty) {


                                      Product productCreated;


                                      if (_currentValueForProductMode !=
                                          'Select from Products List') {
                                        //creating a new product

                                        dynamic productJsonData = await ApiRequests().addProduct(

                                          Product(
                                              name: _productNameController.text,
                                              description:
                                              _productDescriptionController
                                                  .text,
                                              currency:
                                              _saleCurrencyController.text,
                                              unitPrice: int.parse(
                                                  _productPriceController.text)),

                                        );

                                        productCreated = mainProductJsonDataToProductModel(productJsonData);

                                        print('new product here');
                                        print(productCreated.productId);

                                        allProducts.add(
                                            productCreated
                                        );

                                        showSnackLong(
                                            context, 'New Product Created', false);
                                      }

                                      //

                                      //
                                      Product productData;
                                      if(_currentValueForProductMode ==
                                          'Select from Products List') {

                                        productData = allProducts.firstWhere((p) =>
                                        p.name ==
                                            _currentProductSelectedFromProductList);

                                      } else{

                                        productData = productCreated;


                                      }



                                      dynamic orderJsonData = await ApiRequests().createOrder(
                                          Order(
                                              product: productData,

                                              //invoiceTitle: _invoiceTitleController.text,
                                             // invoiceDescription: _invoiceDescriptionController.text,
                                             // currency: _saleCurrencyController.text,
                                             // amountOrdered: int.parse(_totalAmountController.text),


                                              paidFor: false)
                                      );

                                      //invoices.add(mainOrderJsonDataToOrderModel(orderJsonData));

                                      //widget
                                      // .refreshOrdersPage(); //so the new order will show on the orders page

                                      //snacks
                                      //showSnackLong(context,
                                         // 'Order Added Successfully', false);



                                      //clear the data
                                     // invoiceDueDate = DateTime.now();





                                      _currentValueForProductMode =
                                      'Select from Products List';
                                      _currentProductSelectedFromProductList =
                                      "${allProducts[0].name}";

                                      _productNameController.clear();

                                      _saleCurrencyController =
                                          TextEditingController(text: 'NGN');
                                      _productPriceController.clear();

                                      _productDescriptionController.clear();

                                      //  Navigator.pop(context);

                                    } else {
                                      showSnackLong(context,
                                          'Please fill out all forms', true);


                                      print(_productNameController.text);
                                      print(_saleCurrencyController.text);
                                      print(_productPriceController.text);
                                      print(_productDescriptionController.text);

                                    }
                                  },
                                  child: CommonTextButtonBig(
                                      text: 'Save Order', textSize: 17),
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
