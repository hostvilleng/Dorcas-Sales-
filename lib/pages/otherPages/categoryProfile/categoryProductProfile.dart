import 'package:dorcashub/general/allExports.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class CategoryProductProfile extends StatefulWidget {

final Product productData;
final String categoryName;
final String categoryID;


const CategoryProductProfile({Key key, @required this.productData, @required this.categoryName, @required this.categoryID}) : super(key: key);

  @override
  _CategoryProductProfileState createState() => _CategoryProductProfileState();
}

class _CategoryProductProfileState extends State<CategoryProductProfile> {
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
                    child: Icon(FontAwesomeIcons.chevronLeft,
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
                        'Product Data',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors().black,
                        ),

                      ),
                    ),
                  ],
                ),
                
               


                SizedBox(height: 20),

                //data form

                Container(
                  constraints: BoxConstraints(maxWidth: 700),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                          Text(
                          'Product ID: ',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors().darkGrey,
                            fontWeight: FontWeight.bold,
                          ),

                          ),

                          Text(
                          widget.productData.productId,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),

                          ),



                        SizedBox(height: 5),

                        Text(
                          'Product Name: ',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors().darkGrey,
                            fontWeight: FontWeight.bold,
                          ),

                        ),

                        Text(
                          widget.productData.name,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),

                        ),



                        SizedBox(height: 5),

                        Text(
                          'Product Sell Currency: ',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors().darkGrey,
                            fontWeight: FontWeight.bold,
                          ),

                        ),

                        Text(
                          widget.productData.currency,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),

                        ),



                        SizedBox(height: 5),
                        Text(
                          'Product Price: ',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors().darkGrey,
                            fontWeight: FontWeight.bold,
                          ),

                        ),

                        Text(
                          widget.productData.unitPrice.toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),

                        ),


                        SizedBox(height: 5),

                        Text(
                          'Product Stock Amount: ',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors().darkGrey,
                            fontWeight: FontWeight.bold,
                          ),

                        ),

                        Text(
                          widget.productData.stockAmount.toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),

                        ),



                        SizedBox(height: 5),

                        Text(
                          'Product Description: ',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors().darkGrey,
                            fontWeight: FontWeight.bold,
                          ),

                        ),

                        Text(
                          widget.productData.description,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),

                        ),


                        SizedBox(
                          height: 40,
                        ),

                         

                        

                        SizedBox(height: 20),

                        
                      ]),
                )
              ],
            ))));
  }
}
