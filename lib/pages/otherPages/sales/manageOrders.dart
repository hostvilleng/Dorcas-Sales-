import 'package:dorcashub/general/allExports.dart';
import 'package:dorcashub/pages/otherPages/orders/orderProfile.dart';
import 'package:dorcashub/pages/otherPages/sales/addOrder.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

List<Order> invoices = [];

Function refreshOrdersPage;

class ManageOrders extends StatefulWidget {
  @override
  _ManageOrdersState createState() => _ManageOrdersState();
}

class _ManageOrdersState extends State<ManageOrders> {
  @override
  Widget build(BuildContext context) {

  refreshOrdersPage = () {
    setState(() {
      
    });
  };



    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                SizedBox(
                  height: 20,
                ), //common space

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                     'Manage Orders',
                    style: TextStyle(
                      color: AppColors().black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                  ),

                    ),
                ],
              ),

                SizedBox(height: 20),

                //Align(
                    //alignment: Alignment.centerRight,
                   // child: CommonTextButton(
                      //text: 'Add Invoice',
                   //   onTapped: () {
                      //  Navigator.push(
                     //       context,
                        //    MaterialPageRoute(
                                //builder: (context) => AddOrder(
                               //       refreshOrdersPage: () {
                                     //   setState(() {});
                                   //   },
                              //      )));
                      //},
                  //  )),

                SizedBox(height: 20),

                //data form

                Container(
                  constraints: BoxConstraints(maxWidth: 700),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                           'Invoices:',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors().darkGrey,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                            children: invoices.map((order) {
                             return OrderWidget(orderData: order);
                        }).toList())
                      ]),
                )
              ],
            ))));
  }
}

class OrderWidget extends StatelessWidget {
  final Order orderData;

  const OrderWidget({Key key, this.orderData}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OrderProfile(orderData: orderData, refreshOrderPage: refreshOrdersPage))
                                    );
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
              ]),
         width: MediaQuery.of(context).size.width - 24,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
              //  width: MediaQuery.of(context).size.width -
              //      70, //this way i am leaving a width of 50px for the forward icon
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextWithMaxLines(
                      text: orderData.invoiceTitle,
                      size: 20,
                      color: AppColors().black,
                      maxLines: 1,
                    ),

                    SizedBox(
                      height: 6,
                    ),
                    CommonTextWithMaxLines(
                      text: orderData.invoiceId,
                      size: 14,
                      color: AppColors().grey,
                      maxLines: 1,
                      bold: true,
                    ),
                    SizedBox(
                      height: 5.5,
                    ),
                    CommonText(
                      text: 'Order Value: ' +
                          orderData.currency +
                          " ${orderData.amountOrdered * orderData.product.unitPrice}",
                      size: 15,
                      color: AppColors().grey,
                    ),
                    SizedBox(
                      height: 5.5,
                    ),
                    CommonText(
                      text: orderData.invoiceDueDate == null ? 'Due Date: not set' : 
                          "Due Date: ${DateFormat('EEE, M/d/y').format(orderData.invoiceDueDate)}",
                      size: 13,
                      color: AppColors().grey,
                    ),
                    SizedBox(
                      height: 12.5,
                    ),
                    CommonText(
                      text: 'Tap for more info',
                      size: 15,
                      color: AppColors().blueAcc,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
