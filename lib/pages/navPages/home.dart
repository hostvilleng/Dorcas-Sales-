//import 'package:carousel_slider/carousel_slider.dart';
import 'package:dorcashub/general/allExports.dart';
//import 'package:dorcashub/pages/navPages/recordsales.dart';
//import 'package:dorcashub/utils/AColors.dart';
//import 'package:dorcashub/pages/otherPages/productProfile/editProduct.dart';
//import 'package:dorcashub/pages/otherPages/productProfile/editProduct.dart';
//import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:intl/intl.dart';
//import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:fl_chart/fl_chart.dart';
import '../otherPages/sales/addOrder.dart';
//import 'dart:math';

//int _currentTipIndex = 0;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //int curChart = 0;
 // Map<int, LineChartData> chartList;
  //List days = [], dayEarning = [];
  //List months = [], monthEarning = [];
 // List weeks = [], weekEarning = [];
  //List catCountList = [], catList = [];
 // List colorList = [];
 // int touchedIndex;
  //final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    //chartList = {0: dayData(), 1: weekData(), 2: monthData()};
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 8),

                      child: Text(
                        'Good Morning, ${currentuser.company.name}',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            height: 1.2
                      ),
                    ),

                    ),
                  Icon(FontAwesomeIcons.solidCircleQuestion,
                   size: 25,
                    color: Colors.black,

                  ),

                  ],

                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, ),
                      child: CommonText(
                        text: DateFormat('MMM, d, y').format(DateTime.now()),
                        size: 13,
                      ),
                    ),


                  ],
                ),
                SizedBox(
                  height: 50,
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, ),
                  child: Text(
                    "Your Business Stats:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 5),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20),
                 child: Container(
                   height: 240,
                   child: PageView(
                     controller: PageController(viewportFraction: 1),
                     scrollDirection: Axis.horizontal,
                     pageSnapping: true,
                     children: <Widget> [

                       Row(
                         children: [
                           Container(
                             width:350,
                             margin: EdgeInsets.only(top: 20),
                             padding: EdgeInsets.all(30),
                             decoration: BoxDecoration(
                                 color: Colors.black,
                                 borderRadius: BorderRadius.circular(10)),

                             child: InkWell(
                               onTap: (){
                                 //
                                 Navigator.push(context,
                                     MaterialPageRoute(builder: (context) => ManageOrders()));
                               },


                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Row(
                                     children: [
                                       Text(
                                         "Total Order",
                                         style: TextStyle(
                                             color: Colors.white,
                                             fontWeight: FontWeight.w600,
                                             fontSize: 17),
                                       ),
                                       Spacer(),
                                       Popup(
                                         menuList:
                                         [
                                           PopupMenuItem(child: TextButton(
                                             child: Text("All Order ",
                                               style: TextStyle(color: Colors.black,
                                                   fontSize: 15),
                                             ),
                                             onPressed: () {
                                               Navigator.push(context,
                                                   MaterialPageRoute(builder: (context) => ManageOrders()));
                                             },

                                           ),
                                           ),

                                           PopupMenuItem(child: TextButton(
                                             child: Text("Pending Order",
                                               style: TextStyle(color: Colors.black,
                                                   fontSize: 15),
                                             ),
                                             onPressed: () {
                                               Navigator.push(context,
                                                   MaterialPageRoute(builder: (context) =>  ManageOrders()));
                                             },

                                           ),
                                           ),

                                           PopupMenuItem(child: TextButton(
                                             child: Text("Completed Order",
                                               style: TextStyle(color: Colors.black,
                                                   fontSize: 15),
                                             ),
                                             onPressed: () {
                                               Navigator.push(context,
                                                   MaterialPageRoute(builder: (context) =>  AddProductCategory()));
                                             },

                                           ),
                                           ),

                                         ],icon: Icon(FontAwesomeIcons.chevronDown,
                                         size: 24,
                                         color: Colors.white,),),

                                     ],
                                   ),
                                   SizedBox(
                                     height: 20,
                                   ),
                                   Row(
                                     children: [


                                       Text(
                                         '${currentuser.company.orderCount}',
                                         style: TextStyle(fontSize: 20, color: Colors.white),
                                       )
                                     ],
                                   ),
                                   Container(
                                     padding: EdgeInsets.all(10),
                                     margin: EdgeInsets.only(top: 20),
                                     decoration: BoxDecoration(
                                         color: Colors.white,
                                         borderRadius: BorderRadius.circular(50)),
                                     child: Text(
                                       "+10% since last month",
                                       style: TextStyle(color: Colors.black, fontSize: 10),
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                           ),
                         ],
                       ),

                       Row(
                         children: [
                           Container(
                             width:350,
                             margin: EdgeInsets.only(top: 20),
                             padding: EdgeInsets.all(30),
                             decoration: BoxDecoration(
                                 color: Color(0xff6280FF),
                                 borderRadius: BorderRadius.circular(10)),

                             child: InkWell(
                               onTap: (){
                                 //
                                 Navigator.push(context,
                                     MaterialPageRoute(builder: (context) => ManageProducts()));
                               },


                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Row(
                                   children: [
                                     Text(
                                       "Total Products",
                                       style: TextStyle(
                                           color: Colors.white,
                                           fontWeight: FontWeight.w600,
                                           fontSize: 17),
                                     ),
                                     Spacer(),
                                     Popup(
                                       menuList:
                                       [
                                         PopupMenuItem(child: TextButton(
                                           child: Text("List Products ",
                                             style: TextStyle(color: Colors.black,
                                                 fontSize: 15),
                                           ),
                                           onPressed: () {
                                             Navigator.push(context,
                                                 MaterialPageRoute(builder: (context) => ManageProducts()));
                                           },

                                         ),
                                         ),

                                         PopupMenuItem(child: TextButton(
                                           child: Text("Add New Product",
                                             style: TextStyle(color: Colors.black,
                                                 fontSize: 15),
                                           ),
                                           onPressed: () {
                                             Navigator.push(context,
                                                 MaterialPageRoute(builder: (context) =>  AddProduct(refreshProductsPage: refreshProductsPage)));
                                           },

                                         ),
                                         ),

                                         PopupMenuItem(child: TextButton(
                                           child: Text("Add Product Category",
                                             style: TextStyle(color: Colors.black,
                                                 fontSize: 15),
                                           ),
                                           onPressed: () {
                                             Navigator.push(context,
                                                 MaterialPageRoute(builder: (context) =>  AddProductCategory()));
                                           },

                                         ),
                                         ),

                                       ],icon: Icon(FontAwesomeIcons.chevronDown,
                                       size: 24,
                                       color: Colors.white,),),

                                   ],
                                 ),
                                 SizedBox(
                                   height: 20,
                                 ),
                                 Row(
                                   children: [


                                     Text(
                                       '${currentuser.company.productCount}',
                                       style: TextStyle(fontSize: 20, color: Colors.white),
                                     )
                                   ],
                                 ),
                                 Container(
                                   padding: EdgeInsets.all(10),
                                   margin: EdgeInsets.only(top: 20),
                                   decoration: BoxDecoration(
                                       color: Colors.white,
                                       borderRadius: BorderRadius.circular(50)),
                                   child: Text(
                                     "+10% since last month",
                                     style: TextStyle(color: Color(0xff6280FF), fontSize: 10),
                                   ),
                                 ),
                               ],
                             ),
                           ),
                           ),
                         ],
                       ),


                       Row(
                         children: [
                           Container(
                             width:350,
                             margin: EdgeInsets.only(top: 20),
                             padding: EdgeInsets.all(30),
                             decoration: BoxDecoration(
                                 color: Colors.black,
                                 borderRadius: BorderRadius.circular(10)),

                             child: InkWell(
                               onTap: (){
                                 //
                                 Navigator.push(context,
                                     MaterialPageRoute(builder: (context) => ManageCustomers()));
                               },

                               child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Row(
                                   children: [
                                     Text(
                                       "Total Customer",
                                       style: TextStyle(
                                           color: Colors.white,
                                           fontWeight: FontWeight.w600,
                                           fontSize: 17),
                                     ),
                                     Spacer(),
                                     Popup(
                                       menuList:
                                       [
                                         PopupMenuItem(child: TextButton(
                                           child: Text("Add Customer",
                                             style: TextStyle(color: Colors.black,
                                                 fontSize: 15),
                                           ),
                                           onPressed: () {
                                             Navigator.push(context,
                                                 MaterialPageRoute(builder: (context) => AddCustomer(refreshCustomerPage: null,)));
                                           },

                                         ),
                                         ),

                                         PopupMenuItem(child: TextButton(
                                           child: Text("Manager Customers",
                                             style: TextStyle(color: Colors.black,
                                                 fontSize: 15),
                                           ),
                                           onPressed: () {
                                             Navigator.push(context,
                                                 MaterialPageRoute(builder: (context) =>  ManageCustomers()));
                                           },

                                         ),
                                         ),

                                       ],icon: Icon(FontAwesomeIcons.chevronDown,
                                       size: 24,
                                       color: Colors.white,),),

                                   ],
                                 ),
                                 SizedBox(
                                   height: 20,
                                 ),
                                 Row(
                                   children: [

                                     Text(
                                       '${currentuser.company.customerCount}',
                                       style: TextStyle(fontSize: 20, color: Colors.white),
                                     )
                                   ],
                                 ),
                                 Container(
                                   padding: EdgeInsets.all(10),
                                   margin: EdgeInsets.only(top: 20),
                                   decoration: BoxDecoration(
                                       color: Colors.white,
                                       borderRadius: BorderRadius.circular(50)),
                                   child: Text(
                                     "+10% since last month",
                                     style: TextStyle(color: Colors.black, fontSize: 10),
                                   ),
                                 ),
                               ],
                             ),
                           ),
                           ),
                         ],
                       ),

                     //  Row(
                       //  children: [
                       //    Container(
                       //      width:350,
                         //    margin: EdgeInsets.only(top: 20),
                        //     padding: EdgeInsets.all(30),
                          //   decoration: BoxDecoration(
                          //       color: Color(0xff6280FF),
                          //       borderRadius: BorderRadius.circular(10)),
                           //  child: Column(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                           //    crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: [
                               //  Row(
                                 //  children: [
                                  //   Text(
                                   //    "Total Sales",
                                   //    style: TextStyle(
                                     //      color: Colors.white,
                                     //      fontWeight: FontWeight.w600,
                                    //       fontSize: 17),
                                   //  ),
                                  //   Spacer(),
                                    // Popup(
                                     //  menuList:
                                    //   [
                                      //   PopupMenuItem(child: TextButton(
                                       //    child: Text("Payment Status",
                                         //    style: TextStyle(color: Colors.black,
                                         //        fontSize: 15),
                                         //  ),
                                        //   onPressed: () {
                                        //     Navigator.push(context,
                                        //         MaterialPageRoute(builder: (context) => ManageOrders()));
                                       //    },

                                      //   ),
                                     //    ),

                                      //   PopupMenuItem(child: TextButton(
                                     //      child: Text("Completed Order",
                                     //        style: TextStyle(color: Colors.black,
                                     //            fontSize: 15),
                                     //      ),
                                     ///      onPressed: () {
                                   //          Navigator.push(context,
                                   //              MaterialPageRoute(builder: (context) =>  AddProduct(refreshProductsPage: refreshProductsPage)));
                                  //         },

                                    //     ),
                               //          ),

                               //        ],icon: Icon(FontAwesomeIcons.chevronDown,
                               //        size: 24,
                              //         color: Colors.white,),),

                              //     ],
                             //    ),
                             //    SizedBox(
                             //      height: 20,
                            //     ),
                            //     Row(
                              //     children: [

                               //      Text(
                               //        '${currentuser.company.employeeCount}',
                                //       style: TextStyle(fontSize: 20, color: Colors.white),
                                //     )
                               //    ],
                              //   ),
                              //   Container(
                              //     padding: EdgeInsets.all(10),
                             //      margin: EdgeInsets.only(top: 20),
                             //      decoration: BoxDecoration(
                             //          color: Color(0xff6280FF),
                             //          borderRadius: BorderRadius.circular(50)),
                             //      child: Text(
                             //        "+10% since last month",
                             //        style: TextStyle(color: Colors.white, fontSize: 10),
                               //    ),
                              //   ),
                            //   ],
                           //  ),
                        //   ),

                       //  ],
                       //),

                     ],
                   ),
                 ),
               ),






               //  SizedBox(height: 25),

               // Padding(
               //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                //  child: Row(
                //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 //   children: [
                 //     Column(
                  //      children: [
                   //       Container(
                  //          height: 100,
                    //        padding: EdgeInsets.all(20),
                          //  decoration: BoxDecoration(
                              //color: Colors.grey.shade100,
                           //   borderRadius: BorderRadius.circular(10),
                           //   boxShadow: [
                            //    BoxShadow(
                             //     color: Colors.white,
                             //     blurRadius: 30,
                             //     spreadRadius: 2,
                             //   )
                           //   ],
                         //   ),

                          //  child: Center(
                          //      child:Image.asset('assets/images/pro.png') ),
                        //  ),
                       //   Text('Products',
                          //  style: TextStyle(
                           //   fontSize: 18,
                          //    fontWeight: FontWeight.bold,
                          //    color: Colors.black54,
                         //   ),),
                      //  ],
                    //  ),

                     // Column(
                       // children: [
                      //    Container(
                       //     height: 100,
                       //     padding: EdgeInsets.all(20),
                       //     decoration: BoxDecoration(
                             // color: Colors.grey.shade100,
                     //         borderRadius: BorderRadius.circular(10),
                        //      boxShadow: [
                         //       BoxShadow(
                        //          color: Colors.white,
                        //          blurRadius: 30,
                          //        spreadRadius: 2,
                          //      )
                        //      ],
                          //  ),

                         //   child: Center(
                         //       child:Image.asset('assets/images/ship.png') ),
                       //   ),
                        //  Text('Shipping',
                         //   style: TextStyle(
                         //     fontSize: 18,
                        //      fontWeight: FontWeight.bold,
                         //     color: Colors.black54,
                        //    ),),
                      //  ],

                    //  ),
                     // Column(
                      //  children: [
                         // Container(
                           // height: 100,
                           // padding: EdgeInsets.all(20),
                          //  decoration: BoxDecoration(
                             // color: Colors.grey.shade100,
                            //  borderRadius: BorderRadius.circular(10),
                             // boxShadow: [
                             //   BoxShadow(
                             //     color: Colors.white,
                           //       blurRadius: 30,
                            //      spreadRadius: 2,
                            //    )
                        //      ],
                        //    ),

                         //   child: Center(
                         //       child:Image.asset('assets/images/trac.png') ),
                      //    ),
                       //   Text('Tracking',
                        //    style: TextStyle(
                      //        fontSize: 18,
                      //        fontWeight: FontWeight.bold,
                     //         color: Colors.black54,
                     //     ),),
                  //      ],

                  //    ),



                     // Text('Tracking',
                       // style: TextStyle(
                        //  fontSize: 18,
                         // fontWeight: FontWeight.bold,
                         // color: Colors.black54,
                       // ),),
                //    ],

                //  ),
            //    ),
                SizedBox(height: 20,),














               // Padding(
                 // padding: const EdgeInsets.symmetric(horizontal: 8.0),

                  //child: BasicTipWiget(
                    //  title: 'DORCAS APPS',
                      //description:
                     // "Dorcas Hub comes with a fully packed App MarketPlace, with Apps specially made to meet your business's needs",
                     // mainButtonText: 'EXPLORE APP STORE',
                     // mainButtonFunction: () {}),
               // ),

               // SizedBox(height: 25),



                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    "To Do List:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8,),
                  child: Container(
                    padding: EdgeInsets.only(top: 5, bottom: 2, right: 20, left: 20),
                    height: 70,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)
                    ),



                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          child: Text("Update Existing Products",
                            style: TextStyle(color: Colors.white,
                                fontSize: 13,
                            fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Products()));
                          },

                        ),


                        Spacer(),

                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 24,
                      color: Colors.white,
                    ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8,),
                  child: Container(
                    padding: EdgeInsets.only(top: 5, bottom: 2, right: 20, left: 20),
                    height: 70,
                    decoration: BoxDecoration(

                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          child: Text("Record your first order",
                            style: TextStyle(color: Colors.white,
                                fontSize: 13,
                            fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Orders()));
                          },

                        ),

                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 24,
                          color: Colors.white,
                        ),
                      ],
                    ),

                  ),
                ),
                SizedBox(
                  height: 2,
                ),

                ///Padding(
                //  padding: const EdgeInsets.only(left: 8, right: 8,),
               //   child: Container(
                //   padding: EdgeInsets.all(20),
                 //   height: 70,
                 //   decoration: BoxDecoration(
                 //       color: Colors.white54,
                  //      borderRadius: BorderRadius.circular(10)),
                 //   child: Row(
                    //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //  children: [
                   //     TextButton(
                    //      child: Text("Record a Sale",
                    //        style: TextStyle(color: Colors.blueGrey,
                     //           fontSize: 15),
                     //     ),
                     //     onPressed: () {
                       //     Navigator.push(context,
                        //        MaterialPageRoute(builder: (context) =>  AddOrder(refreshOrdersPage: refreshOrdersPage)));
                        //  },

                     //   ),

                      //  Spacer(),
                       // Icon(
                       //   Icons.arrow_forward_ios_rounded,
                        //  size: 24,
                       //   color: Colors.black,
                      //  ),
                     // ],
                   // ),
                 // ),
               // ),








                // Divider(
                //   thickness: 1,
                //   color: AppColors().blandGrey3,
                //   height: 1,
                // ),

                // SizedBox(height: 20),

                //CommonText(
                  //text: 'Your Business Stats:',
                  //bold: true,
                 // color: AppColors().darkGrey,
              //  ),


               // CommonOptionContainerType3(
                //  title: 'Employees',
                //  subText: '${currentuser.company.employeeCount}',
               //   onTap: () {},
               //   noArrow: true,
              //  ),
              //  CommonOptionContainerType3(
              //    title: 'Customers',
               //   subText: '${currentuser.company.customerCount}',
               //   onTap: () {},
               //   noArrow: true,
              //  ),
             //   CommonOptionContainerType3(
                  //title: 'Orders',
                  //subText: '${currentuser.company.orderCount}',
                  //onTap: () {
                    //Navigator.push(
                       // context,
                     //   MaterialPageRoute(
                   //         builder: (context) => ManageOrders()));
                 // },
                  //noArrow: false,
                //),

              //  SizedBox(height: 20),
               // CarouselSlider(
                   // options: CarouselOptions(
                    //    height: 350,
                    //    viewportFraction: 0.7,
                    //    initialPage: _currentTipIndex,
                    //    enableInfiniteScroll: false,
                    //    reverse: false,
                    //    autoPlay: false,
                      //  scrollDirection: Axis.horizontal,
                     //   onPageChanged: (index, reason) {
                      //    setState(() {
                       //     _currentTipIndex = index;
                      //    });
                      //  }),
                   // items: [
                   //   LongTipContainer(
                      //    icon: AppIcons().verification,
                      //    title: 'Account Verification Pending',
                      //    description:
                      //    'Your account has not yet been verified, would you like to do that now?',
                     //     mainButtonText: 'SEND VERIFICATION',
                      //    mainButtonFunction: () {}),
                     // LongTipContainer(
                     //   icon: AppIcons().customer,
                      //  title: 'Add Your First Customer',
                      //  description:
                      //  'Add your customer details here and keep track it',
                      //  mainButtonText: 'ADD CUSTOMER',
                       // mainButtonFunction: () {
                        //  Navigator.push(
                         //     context,
                          //    MaterialPageRoute(
                          //        builder: (context) => AddCustomer()));
                      //  },
                    //  ),
                    //  LongTipContainer(
                     //     icon: AppIcons().tag,

                       //   title: 'Add Your First Sale',
                       //   description:
                        //  'Add your past sale details here and keep track it',
                        //  mainButtonText: 'ADD SALE',
                      //    mainButtonFunction: () {}),
                   // ]),
             //   SizedBox(height: 5),
             //   Align(
              //    alignment: Alignment.center,
              //    child: Container(
               //     width: 50,
                //    height: 40,
                //    child: Row(
                 //       mainAxisSize: MainAxisSize.max,
                //        mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //      crossAxisAlignment: CrossAxisAlignment.center,
                  //      children: List.generate(3, (index) {
                 //         return Container(
                   //         width: 7,
                  //          decoration: BoxDecoration(
                  //            shape: BoxShape.circle,
                    //          color: _currentTipIndex == index
                    //              ? AppColors().darkGrey
                   //               : AppColors().grey,
                  //          ),
                    //      );
                    //    })),
                //  ),
              //  ),

                SizedBox(height: 20),


                //  BasicTipWiget(
                //    title: 'TIP #1',
                //           description:
                //               'Add any form of product you might want to sell, Add any form of product you might want to sell',
                //           mainButtonText: 'ADD PRODUCT',
                //           mainButtonFunction: () {}
                //  ),

                //  ImageTipWiget(
                //    title: 'IMAGE TIP',
                //           description:
                //               'Add any form of product you might want to sell, Add any form of product you might want to sell',
                //               imageUrl: 'https://images.unsplash.com/photo-1627421367074-0735f6ddc254?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=376&q=80',
                //           mainButtonText: 'OKAY',
                //           mainButtonFunction: () {}
                //  ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),

                  child: BasicTipWiget(
                      title: 'Docars App',
                      description:
                      "Dorcas Hub comes with a fully packed App MarketPlace, with Apps specially made to meet your business's needs",
                      mainButtonText: 'EXPLORE APP STORE',
                      mainButtonFunction: () {}),
                ),

                SizedBox(height: 20),



                // SizedBox(height: 20),

                // TheHubRichText(commonTexts: [
                //   CommonText(
                //     text: 'Orders: ',
                //     bold: true,
                //     color: AppColors().darkGrey,
                //   ),
                //   CommonText(
                //     text: '(last 2 weeks)',
                //     color: AppColors().darkGrey,
                //   ),
                // ]),

                // SizedBox(height: 20),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [

                //     Container(
                //       height: 20,
                //       width: 20,
                //       decoration: BoxDecoration(
                //         shape: BoxShape.circle,
                //         color: AppColors().blueAcc
                //         ),
                //     ),

                //     SizedBox(width: 20,),

                //     CommonText(text: 'Orders', size: 15,)

                //   ],
                // ),


                //  SizedBox(height: 10),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [

                //     Container(
                //       height: 20,
                //       width: 20,
                //       decoration: BoxDecoration(
                //         shape: BoxShape.circle,
                //         color: AppColors().greenAcc
                //         ),
                //     ),

                //     SizedBox(width: 20,),

                //     CommonText(text: 'Sales', size: 15,)

                //   ],
                // ),

                SizedBox(height: 20),

                // Center(
                //   child: SafeArea(
                //     child: Container(
                //       width: MediaQuery.of(context).size.width,
                //       height: 500,
                //       child: GroupedBarChart.withSampleData(),
                //     ),
                //   ),
                // ),

              ]),
        ),

    ),


    );
  }
}
class  Popup extends StatelessWidget {
final List<PopupMenuEntry> menuList;
final Widget icon;

const Popup({Key key,  this.menuList, this.icon}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      itemBuilder: ((context) => menuList),
    icon: icon,);
  }
}

//getChart(){
  ///return Padding(
   //   padding: const EdgeInsets.symmetric(horizontal: 4),
   //   child: Container(
    //  decoration: BoxDecoration(
    //  borderRadius: BorderRadius.circular(5),
    //  color: Colors.white,
   //     ),
    //      height: 250,
    //      child: Card(
     //       elevation: 0,
    //        margin: EdgeInsets.only(top: 10, left: 5, right: 15),
   //       child: Column(
   //           children: <Widget>[
  //          Align(
   //           alignment: Alignment.topLeft,
     //   child: Padding(
      //          padding: const EdgeInsets.only(left: 8.0, top: 8),
      //      child: Text( "ProductSales",
          //  style: TextStyle(
         //   color: Colors.blueAccent,
 // ),),),),],
//  ),),),);







//}
