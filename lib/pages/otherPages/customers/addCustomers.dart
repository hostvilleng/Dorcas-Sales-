import 'package:dorcashub/general/allExports.dart';
import 'package:flutter/cupertino.dart';

import '../../../jsonToModels/customer.dart';

TextEditingController _firstNameController = TextEditingController();
TextEditingController _lastNameController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _phoneNumController = TextEditingController();

class AddCustomer extends StatefulWidget {
  final Function refreshCustomerPage;

  const AddCustomer({Key key, @required this.refreshCustomerPage})
      : super(key: key);

  @override
  _AddCustomerState createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
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
                      text: 'Add Customer',
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
                              text: 'FirstName:',
                              size: 17,
                            ),
                            SizedBox(height: 12),
                            CommonTextFieldSmall(
                              controller: _firstNameController,
                              hintText: 'John',
                            ),

                            SizedBox(
                              height: 20,
                            ), //common space

                            CommonText(
                              text: 'LastName:',
                              size: 17,
                            ),
                            SizedBox(height: 12),
                            CommonTextFieldSmall(
                              controller: _lastNameController,
                              hintText: 'Doe',
                            ),

                            SizedBox(
                              height: 20,
                            ), //common space

                            CommonText(
                              text: 'Email:',
                              size: 17,
                            ),
                            SizedBox(height: 12),
                            CommonTextFieldSmall(
                              controller: _emailController,
                              hintText: 'johndoe@gmail.com',
                            ),

                            SizedBox(
                              height: 20,
                            ), //common space

                            CommonText(
                              text: 'Phone Number:',
                              size: 17,
                            ),
                            SizedBox(height: 12),
                            CommonTextFieldSmall(
                              controller: _phoneNumController,
                              hintText: '08012345678',
                            ),

                            SizedBox(
                              height: 20,
                            ), //common space

                            //add button

                            Align(
                              alignment: Alignment.bottomCenter,
                              child: GestureDetector(
                                onTap: () async {
                                  dynamic customerJsonData =
                                  await ApiRequests().addCustomer(Customer(
                                      firstName: _firstNameController.text,
                                      lastName:
                                      _lastNameController.text,
                                      email: _emailController.text,
                                      phoneNumber: _phoneNumController.text,
                                      addedOn: null ),
                                  );

                                  allCustomers.add(
                                      mainCustomerJsonDataToCustomerModel(
                                          customerJsonData));


                                  //widget.refreshCustomerPage();


                                  _firstNameController.clear();
                                  _lastNameController.clear();
                                  _emailController.clear();
                                  _phoneNumController.clear();



                                  showSnackLong(context,
                                      'Customer Added Successfully', false);

                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10.0,bottom: 17,),
                                  child: Container(
                                    height: 50,
                                    //padding: EdgeInsets.only(top: 20,bottom: 20,),
                                    decoration: BoxDecoration(color: Colors.blueAccent,
                                      borderRadius: BorderRadius.circular(15),
                                    ),

                                    child: Center(
                                      child: Text(
                                        "Save",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),),

                            SizedBox(
                              height: 20,
                            ),
                          ]),
                    )
                  ],
                ))));
  }
}







