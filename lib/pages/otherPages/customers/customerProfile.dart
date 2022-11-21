import 'package:dorcashub/general/allExports.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

TextEditingController _userNoteController = TextEditingController();

class CustomerProfile extends StatefulWidget {
  final Customer customerData;
  const CustomerProfile({@required this.customerData});
  @override
  _CustomerProfileState createState() => _CustomerProfileState();
}

class _CustomerProfileState extends State<CustomerProfile> {
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
                      child: Text(
                        'Customer Profile',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: AppColors().black,
                        ),

                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                  ],
                ),

                SizedBox(height: 20),

                //data form

                Container(
                  constraints: BoxConstraints(maxWidth: 700),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //customer data
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                   'Name: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors().darkGrey,
                                  ),
                                ),
                                Text(
                                  '${widget.customerData.firstName+ ' ' +widget.customerData.lastName}',
                                  style: TextStyle(
                                    color: AppColors().black,
                                  ),

                                ),
                              ],

                            ),

                          SizedBox(
                            height: 10,
                          ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Email: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors().darkGrey,
                                  ),
                                ),
                                Text(
                                  '${widget.customerData.email}',
                                  style: TextStyle(
                                    color: AppColors().black,
                                  ),
                                ),
                              ],
                            ),
                          SizedBox(
                            height: 10,
                          ),


                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                   'Phone Number: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors().darkGrey,),
                                ),
                                Text(
                                  '${widget.customerData.phoneNumber}',
                                  style: TextStyle(
                                    color: AppColors().black,),
                                ),
                              ],
                            ),

                          SizedBox(
                            height: 10,
                          ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                   'Date Added: ',
                                 style: TextStyle(
                                   fontWeight: FontWeight.bold,
                                  color: AppColors().darkGrey,),
                                ),
                                Text(
                                  '${DateFormat('MMM, d, y').format(widget.customerData.addedOn)}',
                                  style: TextStyle(
                                    color: AppColors().black,),
                                ),
                              ],
                            ),

                          SizedBox(
                            height: 20,
                          ),

                          //customer notes
                          Text(
                             'Notes:',
                            style: TextStyle(
                           fontWeight: FontWeight.bold,
                            color: AppColors().darkGrey,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                    'You can store here extra info unique to ${widget.customerData.lastName + ' ' + widget.customerData.firstName}',
                               style: TextStyle(fontSize: 12,
                                color: AppColors().grey,),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 10,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(

                                    '${widget.customerData.lastName + ' ' + widget.customerData.firstName} currently has no notes',
                               style: TextStyle( fontSize: 12,
                                color: AppColors().grey,),

                              ),
                            ],
                          ),

                          SizedBox(
                            height: 20,
                          ), //common space
                          Padding(
                            padding: const EdgeInsets.only(right:25, left: 25,),
                            child: TextField(
                              decoration: InputDecoration(
                                fillColor: Colors.white24,
                                labelText: "New Note",
                              ),
                              controller: _userNoteController,

                            ),
                          ),

                          SizedBox(
                            height: 20,
                          ), //common space

                          //add button
                          Align(
                            alignment: Alignment.center,
                            child: CommonTextButtonBig(
                              text: 'Save Note',
                              textSize: 17,
                            ),
                          ),

                          SizedBox(
                            height: 70,
                          ),

                          //customer groups
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                               'Groups:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors().darkGrey,
                                ),

                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  'Manage groups ${widget.customerData.lastName + ' ' + widget.customerData.firstName} will belong to',
                                  style: TextStyle(fontSize: 12,
                                    color: AppColors().grey,),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 20,
                          ),

                          //Align(
                            //alignment: Alignment.center,
                           // child: CommonDropDown(options: ['hi', 'lncd', 'scds'], currentValue: 'hi', onChanged: (){})),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(

                                    '${widget.customerData.lastName + ' ' + widget.customerData.firstName} currently belongs to no group',
                               style: TextStyle(fontSize: 12,
                                color: AppColors().grey,),

                              ),
                            ],
                          ),

                          SizedBox(
                            height: 20,
                          ),

                        ]),
                  ),
                )
              ],
            ))));
  }
}
