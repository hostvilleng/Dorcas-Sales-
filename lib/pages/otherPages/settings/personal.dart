import 'package:dorcashub/general/allExports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

TextEditingController _firstNameController = TextEditingController();
TextEditingController _lastNameController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _phoneNumController = TextEditingController();

class PersonalSettings extends StatefulWidget {
  @override
  _PersonalSettingsState createState() => _PersonalSettingsState();
}

class _PersonalSettingsState extends State<PersonalSettings> {
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Update Profile ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: AppColors().black,
                        ),

                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 8,bottom: 10),
                  child: Container(
                    height: 40,

                    child: TextFormField(
                      textInputAction: TextInputAction.newline,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        //hintText: "Short Description:",
                        labelText: 'First name:',
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

                //data form

                SizedBox(
                  height: 5,
                ), //common space

                Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 8,bottom: 10),
                  child: Container(
                    height: 40,

                    child: TextFormField(
                      textInputAction: TextInputAction.newline,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        //hintText: "Short Description:",
                        labelText: 'Last Name :',
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
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 8,bottom: 10),
                  child: Container(
                    height: 40,

                    child: TextFormField(
                      textInputAction: TextInputAction.newline,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        //hintText: "Short Description:",
                        labelText: 'Email :',
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
                      textInputAction: TextInputAction.newline,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        //hintText: "Short Description:",
                        labelText: 'Phone Number :',
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
                ),
                //common space

                SizedBox(
                  height: 20,
                ), //common space

                //add button

                Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () async {
                      if(_firstNameController.text.isNotEmpty &&
                          _lastNameController.text.isNotEmpty &&
                          _emailController.text.isNotEmpty &&
                          _phoneNumController.text.isNotEmpty) {
                        Customer customerCreated;
                      }
                    },


                    child: CommonTextButtonBig(text: 'Update profile', textSize: 17),
                  ),),

                SizedBox(
                  height: 20,
                )
              ],
            ))));
  }
}
