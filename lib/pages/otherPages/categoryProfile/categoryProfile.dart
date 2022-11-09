import 'package:dorcashub/general/allExports.dart';
import 'package:dorcashub/pages/otherPages/categoryProfile/editCategory.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

String _categoryName;
List<Product> _categoryProducts;

class CategoryProfile extends StatefulWidget {
  final Function refreshCategoryPage;
  final ProductCategory productCategoryData;

  const CategoryProfile(
      {Key key,
      @required this.productCategoryData,
      @required this.refreshCategoryPage})
      : super(key: key);

  @override
  _CategoryProfileState createState() => _CategoryProfileState();
}

class _CategoryProfileState extends State<CategoryProfile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _categoryName = widget.productCategoryData.categoryName;
    _categoryProducts = widget.productCategoryData.categoryProducts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
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
                        'Product Category Data',
                        style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 24,
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
                        Row(
                          children: [
                            Text(
                               'Product Category ID: ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors().darkGrey,
                              ),


                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              widget.productCategoryData.categoryID,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,

                              ),

                            ),
                          ],
                        ),

                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              'Product Category Name: ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors().darkGrey,
                              ),

                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              _categoryName,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,

                              ),

                            ),
                          ],
                        ),


                        SizedBox(height: 5),

                       Text(
                          'Products: ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors().darkGrey,
                          ),
                        ),
                        SizedBox(height: 5),
                        Column(
                            children: _categoryProducts.map((product) {
                          return CategoryProductWidget(
                            productData: product,
                            categoryID: widget.productCategoryData.categoryID,
                            categoryName: _categoryName,
                          );
                        }).toList()),
                        SizedBox(
                          height: 40,
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EditProductCategory(
                                                productCategoryData: widget
                                                    .productCategoryData)));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: AppColors().mainColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(7))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 10),
                                  child: Text(
                                  'EDIT PRODUCT CATEGORY',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),

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
                                            SizedBox(height: 17), //common space

                                            Text(
                                               'WARNING:',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey,
                                              ),

                                            ),

                                            SizedBox(height: 20), //common space

                                            Text(

                                                  'Are you sure you want to delete "$_categoryName" Product Category?',
                                            ),

                                            SizedBox(height: 20), //common space

                                            Align(
                                                alignment: Alignment.center,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    productCategories.remove(
                                                        widget
                                                            .productCategoryData);
                                                    refreshCategoryPage();

                                                    showSnackLong(
                                                        context,
                                                        'Product Category Deleted',
                                                        true);

                                                    Navigator.pop(context);
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: AppColors().red,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    7))),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 40,
                                                          vertical: 10),
                                                      child: Text(
                                                         'DELETE',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.white,
                                                        ),

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
                                                                Radius.circular(
                                                                    7))),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 40,
                                                          vertical: 10),
                                                      child: Text(
                                                        'CANCEL',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.white,
                                                        ),
                                                        
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
                                  child: Text(
                                   'DELETE PRODUCT CATEGORY',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                   
                                  ),
                                ),
                              ),
                            )),
                        SizedBox(height: 20),
                      ]),
                )
              ],
            ))));
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
                    Text(
                      productData.name,
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors().black,
                      ),
                    ),
                    SizedBox(
                      height: 12.5,
                    ),
                    Text(
                       productData.currency +
                          ' ' +
                          productData.unitPrice.toString(),
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors().black, 
                      ),
                      
                    ),
                    Text(
                       productData.stockAmount.toString() + ' in stock',
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors().grey,
                      ),
                 
                     
                    ),
                    SizedBox(
                      height: 12.5,
                    ),
                    Text(
                     'Tap for more info',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors().blueAcc,
                      ),
                     
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
