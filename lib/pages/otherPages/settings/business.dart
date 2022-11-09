import 'package:dorcashub/general/allExports.dart';
import 'package:flutter/cupertino.dart';

//
TextEditingController _businessNameController = TextEditingController();
TextEditingController _regNumberController = TextEditingController();
TextEditingController _contactPhoneController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _websiteController = TextEditingController();

//
TextEditingController _addressLine1Controller = TextEditingController();
TextEditingController _addressLine2Controller = TextEditingController();
TextEditingController _cityController = TextEditingController();
TextEditingController _stateController = TextEditingController();

class PersonalSettingse extends StatefulWidget {
  @override
  _PersonalSettingseState createState() => _PersonalSettingseState();
}

class _PersonalSettingseState extends State<PersonalSettingse> {
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

                  Text(
                  'Business Information',
                    style: TextStyle(
                      fontSize: 24,
                      color: AppColors().black,
                      fontWeight:  FontWeight.bold,

                    ),
                  ),

                  SizedBox(height: 20),

                  //data form

                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right:8.0),
                    child: Container(
                        constraints: BoxConstraints(maxWidth: 600),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                         TextFormField(
                        textInputAction: TextInputAction.newline,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            //hintText: "Short Description:",
                            labelText: 'Business Name:',
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
                          controller: _businessNameController,
                        ),

                            SizedBox(
                              height: 10,
                            ), //common space

                            TextFormField(
                              textInputAction: TextInputAction.newline,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                //hintText: "Short Description:",
                                labelText: 'Registration Number:',
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
                              controller: _regNumberController,
                            ),

                            SizedBox(
                              height: 10,
                            ), //common space

                            TextFormField(
                              textInputAction: TextInputAction.newline,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                //hintText: "Short Description:",
                                labelText: 'Contact:',
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
                              controller: _contactPhoneController,
                            ),


                            SizedBox(
                              height: 10,
                            ), //common space

                            TextFormField(
                              textInputAction: TextInputAction.newline,
                              keyboardType: TextInputType.multiline,
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


                            SizedBox(
                              height: 10,
                            ), //common space

                            TextFormField(
                              textInputAction: TextInputAction.newline,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                //hintText: "Short Description:",
                                labelText: 'Website :',
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
                              controller: _websiteController,
                            ),
                            SizedBox(
                              height: 15,
                            ), //common space

                            //add button

                            Align(
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: CommonTextButtonBig(
                                      text: 'Update Business Profile',
                                      textSize: 17),
                                )),

                            SizedBox(
                              height: 10,
                            ),
                            MyDivider(),
                            SizedBox(
                              height: 10,
                            ),

                            Text(
                              'Address Information',
                              style: TextStyle(
                                fontSize: 24,
                                  color: AppColors().black,
                              fontWeight: FontWeight.w400,
                              ),

                            ),

                            SizedBox(height: 20),

                            //data form

                            Container(
                              constraints: BoxConstraints(maxWidth: 700),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextFormField(
                                      textInputAction: TextInputAction.newline,
                                      keyboardType: TextInputType.multiline,
                                      decoration: InputDecoration(
                                        //hintText: "Short Description:",
                                        labelText: 'Address :',
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
                                      controller: _addressLine1Controller,
                                    ),
                                    SizedBox(height: 10),
                                    TextFormField(
                                      textInputAction: TextInputAction.newline,
                                      keyboardType: TextInputType.multiline,
                                      decoration: InputDecoration(
                                        //hintText: "Short Description:",
                                        labelText: 'Address :',
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
                                      controller: _addressLine2Controller,
                                    ),

                                    SizedBox(
                                      height: 10,
                                    ), //common space
                                    TextFormField(
                                      textInputAction: TextInputAction.newline,
                                      keyboardType: TextInputType.multiline,
                                      decoration: InputDecoration(
                                        //hintText: "Short Description:",
                                        labelText: 'State:',
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
                                      controller: _stateController,
                                    ),


                                    SizedBox(
                                      height: 10,
                                    ), //common space
                                    TextFormField(
                                      textInputAction: TextInputAction.newline,
                                      keyboardType: TextInputType.multiline,
                                      decoration: InputDecoration(
                                        //hintText: "Short Description:",
                                        labelText: 'City :',
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
                                      controller: _cityController,
                                    ),


                                    SizedBox(
                                      height: 10,
                                    ), //common space
                                    //add button
                                    Align(
                                        alignment: Alignment.center,
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: CommonTextButtonBig(
                                              text: 'Update Profile',
                                              textSize: 17),
                                        )),

                                    SizedBox(
                                      height: 10,
                                    ),
                                    MyDivider(),
                                    SizedBox(
                                      height: 10,
                                    ),

                                   // CommonText(
                                   //   text: 'MarketPlace',
                                   //   size: 24,
                                   //   color: AppColors().black,
                                  //    bold: true,
                                  //  ),

                                    SizedBox(height: 20),

                                    SizedBox(
                                      height: 20,
                                    ),
                                  ]),
                            )
                          ],
                        )),
                  )
                ]))));
  }
}
