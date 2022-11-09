import 'package:dorcashub/general/allExports.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

Function refreshCustomerPage;

class ManageCustomers extends StatefulWidget {
  @override
  _ManageCustomersState createState() => _ManageCustomersState();
}

class _ManageCustomersState extends State<ManageCustomers> {
  @override
  Widget build(BuildContext context) {

    refreshCustomerPage = () {

      setState(() {

      });

    };
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(
              height: 20,
            ), //common space

            Row(
            //  mainAxisAlignment: MainAxisAlignment.center,
              children: [

              ],
            ),


            //data form

            Container(
              constraints: BoxConstraints(maxWidth: 600),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Your Customers:',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Column(
                      children: allCustomers.map((customers) {
                        return CustomerWidget(customerData: customers);
                      }).toList()
                    ),

                    SizedBox(
                      height: 20,
                    ),
                   //CustomerWidget(customerData: Customer(firstName: 'OlaOluwa', lastName: 'Adeyemo', email: 'olaoluwaadeyemo7@gmail.com', phoneNumber: '09073237764', addedOn: DateTime.now(), noteAbout: 'Thank GOD.', ),),

                  ]),
            )
          ],
        )));
  }
}


class CustomerWidget extends StatelessWidget {

  final Customer customerData;

  const CustomerWidget({Key key, this.customerData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(

        onTap: () {

          Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CustomerProfile(customerData: customerData)));
          

        },

        child: Container(
          margin: EdgeInsets.only(bottom: 25),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors().textWhite,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(color: AppColors().blandGrey, offset: Offset(1, 2)),
              BoxShadow(color: AppColors().blandGrey, offset: Offset(-2, 1)),
            ]
          ),
         // width: MediaQuery.of(context).size.width - 24,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
      
      
              Container(
               // width: MediaQuery.of(context).size.width - 45, //this way i am leaving a width of 50px for the forward icon
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      '${customerData.lastName + ' ' + customerData.firstName}',
                      style: TextStyle(fontSize: 15, color: Colors.black54),
                    ),
      
                    SizedBox(height: 12.5,),

                    Text(
                      '${customerData.email}',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    //CommonText(
                      //text: 'Added on ' + DateFormat('MMM, d, y').format(customerData.addedOn),
                      //size: 18,
                     // color: AppColors().grey,
                   // ),
      
                    SizedBox(height: 12.5,),
      
                    Text(
                      'Tap for more info', style:
                   TextStyle(
                     fontSize: 12,
                     color: AppColors().blueAcc,
                   )

                    ),
      
                  ],
                ),
              ),
      
      
             // Icon(
               // CupertinoIcons.forward,
               // size: 24,
              //  color: AppColors().mainColor,
            //  ),
            ],
          ),
        ),
      ),
    );
  }
}
