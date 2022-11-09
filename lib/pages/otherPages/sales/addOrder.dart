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

DateTime invoiceDueDate = DateTime.now();
bool _invoiceReminderValue = false;

// vars for customer's section

String _currentValueForCustomerMode = 'Add a new Customer';
String _currentCustomerSelectedFromCustomerList =
    "${allCustomers[0].lastName} ${allCustomers[0].firstName}";

TextEditingController _firstNameController = TextEditingController();
TextEditingController _lastNameController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _phoneNumController = TextEditingController();

// vars for product's section

String _currentValueForProductMode = 'Add a new Product';
String _currentProductSelectedFromProductList = allProducts[0].name;

TextEditingController _productNameController = TextEditingController();
TextEditingController _saleCurrencyController = TextEditingController(text: 'NGN');
TextEditingController _productPriceController = TextEditingController();
TextEditingController _productDescriptionController = TextEditingController();

class AddOrder extends StatefulWidget {
  final Function refreshOrdersPage;

  const AddOrder({Key key, @required this.refreshOrdersPage}) : super(key: key);

  @override
  _AddOrderState createState() => _AddOrderState();
}

class _AddOrderState extends State<AddOrder> {
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
                      text: 'Add Order',
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

                        Padding(
                          padding: const EdgeInsets.only(right: 8.0, left: 8,bottom: 10),
                          child: allCustomers.length > 0
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CommonText(
                                      text: 'Customer Mode:',
                                      size: 17,
                                    ),
                                    SizedBox(height: 12),
                                    CommonDropDown(
                                        options: [
                                          'Select from Customers List',
                                          'Add a new Customer'
                                        ],
                                        currentValue:
                                            _currentValueForCustomerMode,
                                        onChanged: (v) {
                                          setState(() {
                                            _currentValueForCustomerMode = v;

                                            //if the person is selecting a customer, fill the customer form fields with the details of the customer (to handle error handling)
                                            if (_currentValueForCustomerMode ==
                                                'Select from Customers List') {
                                              Customer customer =
                                                  allCustomers.firstWhere((c) =>
                                                      "${c.lastName} ${c.firstName}" ==
                                                      _currentCustomerSelectedFromCustomerList);

                                              _firstNameController.text =
                                                  customer.firstName;

                                              _lastNameController.text =
                                                  customer.lastName;

                                              _emailController.text =
                                                  customer.email;

                                              _phoneNumController.text =
                                                  customer.phoneNumber;
                                            } else if (_currentValueForCustomerMode ==
                                                'Add a new Customer') {
                                              //clear all the fields (so the new values can be placed in)

                                              _firstNameController.clear();

                                              _lastNameController.clear();

                                              _emailController.clear();

                                              _phoneNumController.clear();
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

                        _currentValueForCustomerMode ==
                                'Select from Customers List'
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonText(
                                    text: 'Select the Customer that Ordered:',
                                    size: 17,
                                  ),
                                  SizedBox(height: 12),
                                  CommonDropDown(
                                      options: allCustomers.map((customer) {
                                        return "${customer.lastName} ${customer.firstName}";
                                      }).toList(),
                                      currentValue:
                                          _currentCustomerSelectedFromCustomerList,
                                      onChanged: (v) {
                                        setState(() {
                                          _currentCustomerSelectedFromCustomerList =
                                              v;
                                        });
                                      }),
                                ],
                              )
                            : Column(
                                //adding a new customer
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                    CommonText(
                                      text: 'Create the Customer that Ordered:',
                                      size: 17,
                                    ),
                                    SizedBox(height: 12),

                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0, left: 8,bottom: 10),
                                    child: Container(
                                      height: 40,

                                      child: TextFormField(

                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          //hintText: "Short Description:",
                                          labelText: 'FirstName:',
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
                                        controller: _firstNameController,
                                      ),
                                    ),
                                  ),

                                    SizedBox(
                                      height: 5,
                                    ), //common space

                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0, left: 8,bottom: 10),
                                    child: Container(
                                      height: 40,

                                      child: TextFormField(

                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          //hintText: "Short Description:",
                                          labelText: 'LastName:',
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
                                        controller: _lastNameController,
                                      ),
                                    ),
                                  ),

                                    SizedBox(
                                      height: 5,
                                    ), //common space

                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0, left: 8,bottom: 10),
                                    child: Container(
                                      height: 40,

                                      child: TextFormField(

                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          //hintText: "Short Description:",
                                          labelText: 'Email:',
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
                                        controller: _emailController,
                                      ),
                                    ),
                                  ),

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
                                          labelText: 'Phone Number:',
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
                                        controller: _phoneNumController,
                                      ),
                                    ),
                                  ),//common space

                                  ]),

                        SizedBox(
                          height: 20,
                        ),

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

                        GestureDetector(
                          onTap: () {

                             setState(() {
                               _invoiceDueDateController.text =
                                                    DateFormat('EEE, M/d/y')
                                                        .format(invoiceDueDate);
                             });
                            // Show the modal that contains the CupertinoDatePicker

                            showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30.0),
                                    topRight: Radius.circular(30.0),
                                  ),
                                ),
                                context: context,
                                builder: (BuildContext context) {
                                  return StatefulBuilder(builder: (BuildContext
                                          context,
                                      StateSetter
                                          setState /*You can rename this!*/) {
                                    return CommonBottomSheetMobile(
                                      heightPercentage: 0.8,
                                      widgets: [
                                        SizedBox(height: 15), //common space

                                        CommonText(
                                          text: 'Invoice Due By:',
                                          size: 17,
                                        ),

                                        SizedBox(height: 17), //common space

                                        Container(
                                          height: 300,
                                          child: CupertinoDatePicker(
                                              mode:
                                                  CupertinoDatePickerMode.date,
                                              initialDateTime: invoiceDueDate,
                                              onDateTimeChanged: (val) {
                                                invoiceDueDate = val;

                                                _invoiceDueDateController.text =
                                                    DateFormat('EEE, M/d/y')
                                                        .format(invoiceDueDate);

                                                setState(() {});
                                              }),
                                        ),

                                        // Close the modal
                                        Center(
                                          child: CupertinoButton(
                                            child: CommonText(
                                              text: 'OK',
                                            ),
                                            onPressed: () =>
                                                Navigator.of(context).pop(),
                                          ),
                                        )
                                      ],
                                      topWidgets: [
                                        Center(
                                            child:
                                                roundedModalSheetTopSitter()),

                                        SizedBox(height: 17), //common space

                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(),
                                            CancelBottomSheetButton(
                                              onTapped: () =>
                                                  Navigator.pop(context),
                                            ),
                                          ],
                                        ),
                                      ],
                                      refreshMe: () => setState(() {}),
                                    );
                                  });
                                });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0, left: 8,bottom: 10),
                            child: Container(
                              height: 40,

                              child: TextFormField(
                                enabled: false,
                                //keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  //hintText: "Short Description:",
                                  labelText: 'Due Date...',
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
                                controller: _invoiceDueDateController,
                              ),
                            ),
                          ),

                            ],
                          ),
                        ),

                        SizedBox(height: 10), //common space

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              value: _invoiceReminderValue,
                              onChanged: (newValue) {
                                setState(() {
                                  _invoiceReminderValue = newValue;
                                });
                              },
                              activeColor: AppColors().mainColor,
                            ),
                            CommonText(
                              text: 'Invoice Reminder (On)',
                              size: 15,
                              color: Colors.grey,
                            ),
                          ],
                        ),

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
                                if (_invoiceTitleController.text.isNotEmpty &&
                                    _invoiceDescriptionController
                                        .text.isNotEmpty &&
                                    _currencyController.text.isNotEmpty &&
                                    _totalAmountController.text.isNotEmpty &&
                                    _invoiceDueDateController.text.isNotEmpty &&
                                    _productNameController.text.isNotEmpty &&
                                    _saleCurrencyController.text.isNotEmpty &&
                                    _productPriceController.text.isNotEmpty &&
                                    _productDescriptionController
                                        .text.isNotEmpty &&
                                    _firstNameController.text.isNotEmpty &&
                                    _lastNameController.text.isNotEmpty &&
                                    _emailController.text.isNotEmpty &&
                                    _phoneNumController.text.isNotEmpty) {

                                      Customer customerCreated;
                                      Product productCreated;


                                      if (_currentValueForCustomerMode !=
                                      'Select from Customers List') {
                                    //creating a new customer

                                  dynamic customerJsonData = await ApiRequests().addCustomer(
                                   _firstNameController.text,
                                        _lastNameController.text,
                                        _emailController.text,
                                        _phoneNumController.text,
                                  );

                                  Customer customerCreated = mainCustomerJsonDataToCustomerModel(customerJsonData);

                                   print('new customer here');
                                   print(customerCreated.addedOn);
                                   print(customerCreated.customerId);


                                    allCustomers.add(customerCreated);




                                    showSnackLong(
                                        context, 'New Customer Created', false);
                                  }

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
                                  Customer customerData;
                                  if (_currentValueForCustomerMode ==
                                              'Select from Customers List') {

                                      customerData = allCustomers.firstWhere(
                                              (c) => "${c.lastName} ${c.firstName}" == _currentCustomerSelectedFromCustomerList);

                                  } else{
                                      customerData = customerCreated;
                                      print(customerData.runtimeType);
                                  }

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
                                      customer: customerData,
                                      invoiceTitle: _invoiceTitleController.text,
                                      invoiceDescription: _invoiceDescriptionController.text,
                                      currency: _saleCurrencyController.text,
                                      amountOrdered: int.parse(_totalAmountController.text),
                                      reminderOn: _invoiceReminderValue,
                                      invoiceDueDate: invoiceDueDate,
                                      paidFor: false)
                                     );

                                  invoices.add(mainOrderJsonDataToOrderModel(orderJsonData));

                                  //widget
                                     // .refreshOrdersPage(); //so the new order will show on the orders page

                                  //snacks
                                  showSnackLong(context,
                                      'Order Added Successfully', false);



                                  //clear the data
                                  _invoiceTitleController.clear();

                                  _invoiceDescriptionController.clear();

                                  _currencyController.clear();

                                  _totalAmountController.clear();

                                  _invoiceDueDateController.clear();

                                  invoiceDueDate = DateTime.now();

                                  _invoiceReminderValue = false;

                                  _currentValueForCustomerMode =
                                      'Select from Customers List';

                                  _currentCustomerSelectedFromCustomerList =
                                      "${allCustomers[0].lastName} ${allCustomers[0].firstName}";

                                  _firstNameController.clear();

                                  _lastNameController.clear();

                                  _emailController.clear();

                                  _phoneNumController.clear();

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

                                  print(_invoiceTitleController.text);
                                  print(_invoiceDescriptionController.text);
                                  print(_currencyController.text);
                                  print(_totalAmountController.text);
                                  print(_invoiceDueDateController.text);
                                  print(_productNameController.text);
                                  print(_saleCurrencyController.text);
                                  print(_productPriceController.text);
                                  print(_productDescriptionController.text);
                                  print(_firstNameController.text);
                                  print(_lastNameController.text);
                                  print(_emailController.text);
                                  print(_phoneNumController.text);
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
