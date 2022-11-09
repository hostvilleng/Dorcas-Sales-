import 'package:dorcashub/general/allExports.dart';
import 'package:dorcashub/pages/otherPages/productProfile/editProduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:dorcashub/data.dart';

class ProductProfile extends StatefulWidget {

  final Product productData;

  const ProductProfile({Key key, @required this.productData}) : super(key: key);

  @override
  _ProductProfileState createState() => _ProductProfileState();
}

class _ProductProfileState extends State<ProductProfile> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Product Info",
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

              Center(
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/logo_dorcas.png'),
                      fit: BoxFit.fitWidth,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 32,
              ),

              Center(
                child: Text(
                  widget.productData.name,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),

              Center(
                child: Text(
                  'Product Id: ' +
                      widget.productData.productId,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),

              Center(
                child: Text(
                  'Product Stock Amount: ' +
                      widget.productData.stockAmount.toString(),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),

              SizedBox(
                height: 32,
              ),

              Row(
                children: [

                  Expanded(
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          widget.productData.currency +
                              widget.productData.unitPrice.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),

               //   Expanded(
                  //  child: Container(
                   //   child: Center(
                      //  child: Text(widget.productData.currency +
                       //   widget.productData.unitPrice.toString(),
                       //   style: TextStyle(
                       //     fontSize: 30,
                      //    ),
                   //     ),
                   //   ),
                  //  ),
                 // ),

                ],
              ),

              SizedBox(
                height: 32,
              ),

              Text(
                "Product Description:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(
                height: 16,
              ),

              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Text(
                        widget.productData.description,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black54
                        ),
                      ),

                    ]
                  ),
                ),
              ),

              SizedBox(
                height: 16,
              ),

              Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  EditProduct(refreshProductsPage: refreshProductsPage, pastProductData: widget.productData,)));

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
                          text: 'EDIT PRODUCT',
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
                                    'Are you sure you want to delete this Product?',
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
                                          await ApiRequests().deleteProduct(widget.productData.productId);
                                          allProducts.remove(widget.productData);
                                          refreshProductsPage();

                                          showSnackLong(
                                              context,
                                              'Product Deleted',
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
                          text: 'DELETE PRODUCT',
                          size: 14,
                          color: Colors.white,
                          alignTextCenter: true,
                        ),
                      ),
                    ),
                  )),

              SizedBox(height: 20),




            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildRequirements(){
    List<Widget> list = [];
    for (var i = 0; i < getJobsRequirements().length; i++) {
      list.add(buildRequirement(getJobsRequirements()[i]));
    }
    return list;
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