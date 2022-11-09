import 'package:dorcashub/general/allExports.dart';
import 'package:dorcashub/models/sales/productCategory.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';


List<ProductCategory> productCategories = [
  
];

Function refreshCategoryPage = () {};


class ProductCategories extends StatefulWidget {
  @override
  _ProductCategoriesState createState() => _ProductCategoriesState();
}

class _ProductCategoriesState extends State<ProductCategories> {
  @override
  Widget build(BuildContext context) {

   refreshCategoryPage = () {
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
                    CommonText(
                      text: 'Product Categories',
                      size: 24,
                      color: AppColors().black,
                      bold: true,
                    ),
                  ],
                ),
                 
                SizedBox(height: 20),

                 Align(
                   alignment: Alignment.centerRight,
                   child: CommonTextButton(text: 'Create Product Category', 
                   onTapped: () {
                      Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddProductCategory(refreshCategoryPage: () {setState(() {
                                      
                                    });})));
                   },
                   )
                 ),

                SizedBox(height: 20),

                //data form

                Container(
                  constraints: BoxConstraints(maxWidth: 700),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        
                        SizedBox(
                          height: 20,
                        ),

                        Column(
                          children: productCategories.map((category) {

                            return ProductCategoryWidget(productCategoryData: category,);

                          }).toList()
                        )

                      ]),
                )
              ],
            ))));
  }
}





class ProductCategoryWidget extends StatelessWidget {

  final ProductCategory productCategoryData;

  const ProductCategoryWidget({Key key, this.productCategoryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(

        onTap: () {

          Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CategoryProfile(productCategoryData: productCategoryData, refreshCategoryPage: refreshCategoryPage,)));
          

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
          width: MediaQuery.of(context).size.width - 24,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
      
      
              Container(
              //  width: MediaQuery.of(context).size.width - 70, //this way i am leaving a width of 50px for the forward icon
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    CommonTextWithMaxLines(
                      text: productCategoryData.categoryName,
                      size: 20,
                      color: AppColors().black,
                      maxLines: 1,
                    ),
      
                    SizedBox(height: 12.5,),
      
                    CommonText(
                      text: productCategoryData.categoryProducts.length.toString() + ' products in this category',
                      size: 18,
                      color: AppColors().grey,
                    ),
      
                    SizedBox(height: 12.5,),
      
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
