import 'package:dorcashub/general/allExports.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

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
                          "Add Customer",
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
                                if ( _firstNameController.text.isEmpty) {
                                  return "This field can't be empty";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                //hintText: "Short Description:",
                                labelText: 'Firstname:',
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
                              controller:  _firstNameController,
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            TextFormField(
                              validator: (value) {
                                if ( _lastNameController.text.isEmpty) {
                                  return "This field can't be empty";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                //hintText: "Short Description:",
                                labelText: 'Lastname:',
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
                              controller:  _lastNameController,
                            ),//common space

                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              validator: (value) {
                                if ( _emailController.text.isEmpty) {
                                  return "This field can't be empty";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                //hintText: "Short Description:",
                                labelText: 'Email:',
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
                              controller:  _emailController,
                            ),//common space

                            SizedBox(
                              height: 10,
                            ),

                            TextFormField(
                              validator: (value) {
                                if ( _phoneNumController.text.isEmpty) {
                                  return "This field can't be empty";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                //hintText: "Short Description:",
                                labelText: 'Phone Number:',
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
                              controller: _phoneNumController,
                            ),//common space

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







