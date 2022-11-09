//import 'package:cached_network_image/cached_network_image.dart';
import 'package:dorcashub/general/allExports.dart';
import 'package:dorcashub/pages/otherPages/customers/customer_button.dart';
//import 'package:flutter_svg/svg.dart';
//import 'package:ionicons/ionicons.dart';
import 'package:flutter/material.dart';

//import '../../reusable_widgets/constants.dart';
//import '../../reusable_widgets/search_form.dart';

List<Customer> allCustomers = [

  // Customer(firstName: 'OlaOluwa', lastName: 'Adeyemo', email: 'olaoluwaadeyemo7@gmail.com', phoneNumber: '09073237764', addedOn: DateTime.now(), noteAbout: 'Thank GOD.'),
  // Customer(firstName: 'Mike', lastName: 'Lawal', email: 'lawal@gmail.com', phoneNumber: '0903989222', addedOn: DateTime.now(), noteAbout: 'Thank GOD.'),

];

class Customers extends StatefulWidget {
  final Function refreshCustomers;
  const Customers({Key key, @required this.refreshCustomers})
      : super(key: key);

  @override
  _CustomersState createState() => _CustomersState();
}

class _CustomersState extends State<Customers> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child:SingleChildScrollView(

            child: Column(
              children: [
                Container(
                  height: 50,
                ),

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
                  Tab(text:"Customers",

                ),
                Tab(text: "Manage Customer"
                ),
                  Tab(text: "Customer Fields"
                  ),
                ],
                ),

        ),

      ),SizedBox(
                  height: 10,
                ),


                SizedBox(
                  height: 650,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TabBarView(children: [
                      Container(child: Center(
                        child: CustomerButton(
                            ),

                      )),
                      SizedBox(
                        height: 650,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(child: ManageCustomers(
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 650,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(child: CustomCustomerField(
                          ),
                          ),
                        ),


                      ),


                    ],

                  ),
                ),
                ),

              ],
            ),
          ),
                  ),

      ),


    );


  }


}

