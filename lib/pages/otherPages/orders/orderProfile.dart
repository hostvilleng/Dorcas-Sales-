import 'package:dorcashub/general/allExports.dart';
import 'package:dorcashub/jsonToModels/order.dart';
import 'package:dorcashub/pages/otherPages/orders/editOrder.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

// String _categoryName;
// List<Product> _categoryProducts;

class OrderProfile extends StatefulWidget {
  final Function refreshOrderPage;
  final Order orderData;

  const OrderProfile(
      {Key key, @required this.orderData, @required this.refreshOrderPage})
      : super(key: key);

  @override
  _OrderProfileState createState() => _OrderProfileState();
}

class _OrderProfileState extends State<OrderProfile> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _categoryName = widget.productCategoryData.categoryName;
  //   _categoryProducts = widget.productCategoryData.categoryProducts;
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Invoice Summary",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            )
        ),
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

            //  Center(
               // child: Container(
                //  height: 50,
                //  width: 50,
                 // decoration: BoxDecoration(
                 //   image: DecorationImage(
                 //     image: AssetImage('assets/images/logo_dorcas.png'),
                //      fit: BoxFit.fitWidth,
               //     ),
               //     borderRadius: BorderRadius.all(
                //      Radius.circular(10),
                //    ),
                //  ),
              //  ),
           //   ),



              Center(
                child: Text(
                  widget.orderData.invoiceTitle,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(
                height: 16,
              ),

              Center(
                child: Text(
                  widget.orderData.invoiceId,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),

              SizedBox(
                height: 26,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Cost: :',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  Text(
                    widget.orderData.currency +
                        " ${widget.orderData.amountOrdered * widget.orderData.product.unitPrice}",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 7,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Due By :',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  Text(
                    widget.orderData.invoiceDueDate == null ? 'not set' : "${DateFormat('EEE, M/d/y').format(widget.orderData.invoiceDueDate)}",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 7,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Reminder on :',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  Text(
                    widget.orderData.reminderOn ? 'Yes' : 'No',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 7,
              ),

              Text(
                'Invoice Description : '+ widget.orderData.invoiceDescription,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(
                height: 25,
              ),

              Text(
                'Product Info',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              MyDivider(),

              SizedBox(
                height: 10,
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Product Name :',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  Text(
                    widget.orderData.product.name,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 7,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Unit Price : ',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  Text(
                      widget.orderData.product.currency + ' ' + widget.orderData.product.unitPrice.toString(),
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 7,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Amount Ordered : ',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  Text(
                    'Pcs ' + widget.orderData.amountOrdered.toString(),
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),

              MyDivider(),


              SizedBox(
                height: 20,
              ),

              Text(
                'Customer info',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),

              SizedBox(height: 10),
              widget.orderData.customer == null ?

              Text(
                'Oops.. The customer details for this order is not avaliable',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ) :


              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  TheHubRichText(commonTexts: [
                    CommonText(
                      text: 'Customer Name: ',
                      bold: true,
                      color: AppColors().darkGrey,
                      size: 16,
                    ),
                    CommonText(
                      text: widget.orderData.customer.lastName + widget.orderData.customer.firstName,
                      color: Colors.black,
                      size: 18,
                    ),
                  ]),
                  SizedBox(height: 5),

                  TheHubRichText(commonTexts: [
                    CommonText(
                      text: 'Email: ',
                      bold: true,
                      color: AppColors().darkGrey,
                      size: 16,
                    ),
                    CommonText(
                      text: widget.orderData.customer.email,
                      color: Colors.black,
                      size: 18,
                    ),
                  ]),
                  SizedBox(height: 5),

                  TheHubRichText(commonTexts: [
                    CommonText(
                      text: 'Phone: ',
                      bold: true,
                      color: AppColors().darkGrey,
                      size: 16,
                    ),
                    CommonText(
                      text: widget.orderData.customer.phoneNumber,
                      color: Colors.black,
                      size: 18,
                    ),
                  ]),

                ],
              ),




              SizedBox(
                height: 10,
              ),



              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Paid For :',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  Text(
                    widget.orderData.paidFor ? 'Yes' : 'No',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
                  SizedBox(
                  height: 20,
                    ),


              Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: AppColors().white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0),
                            ),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return StatefulBuilder(builder:
                                (BuildContext context,
                                StateSetter setState) {
                              return CommonBottomSheetMobile(
                                heightPercentage: 0.45,
                                refreshMe: () => setState(() {}),
                                topWidgets: [
                                  Center(
                                      child:
                                      roundedModalSheetTopSitter()),
                                ],
                                widgets: [
                                  SizedBox(
                                      height: 17), //common space

                                  CommonText(
                                    text: 'WARNING:',
                                    size: 17,
                                    color: Colors.grey,
                                    bold: true,
                                  ),

                                  SizedBox(
                                      height: 20), //common space

                                  Text(
                                    'Are you sure you want to mark this Order has a paid order',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),

                                  SizedBox(
                                      height: 20), //common space

                                  Align(
                                      alignment: Alignment.center,
                                      child: GestureDetector(
                                        onTap: () async{


                                          invoices.remove(widget.orderData);

                                          dynamic orderJsonData = await ApiRequests().editOrder(
                                              Order(
                                                  product: widget.orderData.product,
                                                  customer: widget.orderData.customer,
                                                  invoiceId: widget.orderData.invoiceId,
                                                  invoiceTitle: widget.orderData.invoiceTitle,
                                                  invoiceDescription: widget.orderData.invoiceDescription,
                                                  currency: widget.orderData.currency,
                                                  amountOrdered: widget.orderData.amountOrdered,
                                                  reminderOn: widget.orderData.reminderOn,
                                                  invoiceDueDate: widget.orderData.invoiceDueDate,
                                                  invoiceDateCreated: widget.orderData.invoiceDateCreated,
                                                  paidFor: true)
                                          );

                                          invoices.add(mainOrderJsonDataToOrderModel(orderJsonData));



                                          refreshOrdersPage();

                                          showSnackLong(
                                              context,
                                              'Order Marked has Paid. Page refreshed',
                                              false);

                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color:
                                              AppColors().red,
                                              borderRadius:
                                              BorderRadius.all(
                                                  Radius
                                                      .circular(
                                                      7))),
                                          child: Padding(
                                            padding:
                                            const EdgeInsets
                                                .symmetric(
                                                horizontal: 40,
                                                vertical: 10),
                                            child: CommonText(
                                              text: 'IT\'S PAID',
                                              size: 14,
                                              color: Colors.white,
                                              alignTextCenter: true,
                                            ),
                                          ),
                                        ),
                                      )),

                                  SizedBox(height: 10),

                                  Align(
                                      alignment: Alignment.center,
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: AppColors()
                                                  .mainColor,
                                              borderRadius:
                                              BorderRadius.all(
                                                  Radius
                                                      .circular(
                                                      7))),
                                          child: Padding(
                                            padding:
                                            const EdgeInsets
                                                .symmetric(
                                                horizontal: 40,
                                                vertical: 10),
                                            child: CommonText(
                                              text: 'CANCEL',
                                              size: 14,
                                              color: Colors.white,
                                              alignTextCenter: true,
                                            ),
                                          ),
                                        ),
                                      )),
                                ],
                              );
                            });
                          });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors().greenAcc,
                          borderRadius:
                          BorderRadius.all(Radius.circular(7))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                        child: CommonText(
                          text: 'MARK ORDER HAS PAID',
                          size: 14,
                          color: Colors.white,
                          alignTextCenter: true,
                        ),
                      ),
                    ),
                  )),

              SizedBox(height: 20),


              Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  EditOrder(pastOrderData: widget.orderData)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors().mainColor,
                          borderRadius:
                          BorderRadius.all(Radius.circular(7))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                        child: CommonText(
                          text: 'EDIT ORDER',
                          size: 14,
                          color: Colors.white,
                          alignTextCenter: true,
                        ),
                      ),
                    ),
                  )),

              SizedBox(height: 20),


              Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: AppColors().white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0),
                            ),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return StatefulBuilder(builder:
                                (BuildContext context,
                                StateSetter setState) {
                              return CommonBottomSheetMobile(
                                heightPercentage: 0.45,
                                refreshMe: () => setState(() {}),
                                topWidgets: [
                                  Center(
                                      child:
                                      roundedModalSheetTopSitter()),
                                ],
                                widgets: [
                                  SizedBox(
                                      height: 17), //common space

                                  CommonText(
                                    text: 'WARNING:',
                                    size: 17,
                                    color: Colors.grey,
                                    bold: true,
                                  ),

                                  SizedBox(
                                      height: 20), //common space

                                  Text(

                                    'Are you sure you want to delete this Order?',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),

                                  SizedBox(
                                      height: 20), //common space

                                  Align(
                                      alignment: Alignment.center,
                                      child: GestureDetector(
                                        onTap: () async{
                                          await ApiRequests().deleteOrder(widget.orderData.invoiceId);
                                          invoices.remove(widget.orderData);
                                          refreshOrdersPage();

                                          showSnackLong(
                                              context,
                                              'Order Deleted',
                                              true);

                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color:
                                              AppColors().red,
                                              borderRadius:
                                              BorderRadius.all(
                                                  Radius
                                                      .circular(
                                                      7))),
                                          child: Padding(
                                            padding:
                                            const EdgeInsets
                                                .symmetric(
                                                horizontal: 40,
                                                vertical: 10),
                                            child: CommonText(
                                              text: 'DELETE',
                                              size: 14,
                                              color: Colors.white,
                                              alignTextCenter: true,
                                            ),
                                          ),
                                        ),
                                      )),

                                  SizedBox(height: 10),

                                  Align(
                                      alignment: Alignment.center,
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: AppColors()
                                                  .mainColor,
                                              borderRadius:
                                              BorderRadius.all(
                                                  Radius
                                                      .circular(
                                                      7))),
                                          child: Padding(
                                            padding:
                                            const EdgeInsets
                                                .symmetric(
                                                horizontal: 40,
                                                vertical: 10),
                                            child: CommonText(
                                              text: 'CANCEL',
                                              size: 14,
                                              color: Colors.white,
                                              alignTextCenter: true,
                                            ),
                                          ),
                                        ),
                                      )),
                                ],
                              );
                            });
                          });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors().red,
                          borderRadius:
                          BorderRadius.all(Radius.circular(7))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                        child: CommonText(
                          text: 'DELETE ORDER',
                          size: 14,
                          color: Colors.white,
                          alignTextCenter: true,
                        ),
                      ),
                    ),
                  )),






            ],
          ),
        ),
      ),
    );
  }





  Widget buildRequirement(String requirement){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [

          Container(
            width: 4,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
          ),

          SizedBox(
            width: 16,
          ),

          Flexible(
            child: Text(
              requirement,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),

        ],
      ),
    );
  }

}
class CategoryProductWidget extends StatelessWidget {
  final Product productData;
  final String categoryName;
  final String categoryID;

  const CategoryProductWidget(
      {Key key,
        this.productData,
        @required this.categoryName,
        @required this.categoryID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CategoryProductProfile(
                    productData: productData,
                    categoryID: categoryID,
                    categoryName: categoryName,
                  )));
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
                width: MediaQuery.of(context).size.width -
                    70, //this way i am leaving a width of 50px for the forward icon
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextWithMaxLines(
                      text: productData.name,
                      size: 20,
                      color: AppColors().black,
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 12.5,
                    ),
                    CommonText(
                      text: productData.currency +
                          ' ' +
                          productData.unitPrice.toString(),
                      size: 18,
                      color: AppColors().black,
                    ),
                    CommonText(
                      text: productData.stockAmount.toString() + ' in stock',
                      size: 18,
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
              Icon(
                CupertinoIcons.forward,
                size: 24,
                color: AppColors().mainColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
