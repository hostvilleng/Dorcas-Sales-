import 'package:dorcashub/general/allExports.dart';
import 'package:dorcashub/pages/otherPages/orders/orderProfile.dart';
import 'package:dorcashub/pages/otherPages/sales/addOrder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ionicons/ionicons.dart';


List<Product> allProducts = [

  //  Product(productId: 'CSDC2523', name: 'CocaCola Coke', description: 'A 50cl plastic bottle at wholesale price', currency: 'NGN', unitPrice: 75, stockAmount: 4640, addedOn: DateTime.now(),),
  //  Product(productId: 'ASWE7432', name: 'CocaCola Fanta', description: 'A 75cl plastic bottle at wholesale price', currency: 'NGN', unitPrice: 120, stockAmount: 800, addedOn: DateTime.now(),),


];

class Sales extends StatefulWidget {
  @override
  _SalesState createState() => _SalesState();
}

class _SalesState extends State<Sales> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
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
                        padding: const EdgeInsets.only(left: 8.0, right: 8, top: 30),
                        child: Text('Orders',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors().black,
                          ),
                        ),
                      ),
                      IconButton(
                        iconSize: 30,
                       icon: Icon(FontAwesomeIcons.circlePlus ,
                          color: Colors.blueAccent),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => AddOrder(refreshOrdersPage: refreshOrdersPage)));

                        },

                      ),


                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 48,
                        width: 300,
                        decoration: BoxDecoration(
                            color: Color(0xFF292639),
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: TabBar(
                            indicator: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            tabs: [
                              Tab(text:"All Orders",

                              ),
                             // Tab(text: "Manage Orders"
                          //    ),

                            ],
                          ),

                        ),

                      ),
                    ],
                  ),

                  SizedBox(height: 30),

                  SizedBox(
                    height: 650,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TabBarView(children: [
                        Container(child: ManageOrders(


                        )),
                      //  SizedBox(
                        //  height: 650,
                         // child: Padding(
                         //   padding: const EdgeInsets.all(8.0),
                         //   child: Container(child: ManageOrders(
                         //   ),
                         //   ),
                         // ),
                       // ),


                      ],

                      ),
                    ),
                  ),




                ],
              )))),
    );
  }
}
