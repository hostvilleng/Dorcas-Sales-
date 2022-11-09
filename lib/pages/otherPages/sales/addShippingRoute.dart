import 'package:dorcashub/general/allExports.dart';
import 'package:flutter/cupertino.dart';

TextEditingController _routeTitleController = TextEditingController();
TextEditingController _routeDescriptionController = TextEditingController();
TextEditingController _currencyController = TextEditingController();
TextEditingController _unitPriceController = TextEditingController();

class AddShippingRoute extends StatefulWidget {

  final Function refreshRoutePage;

  const AddShippingRoute({Key key, @required this.refreshRoutePage}) : super(key: key);

  @override
  _AddShippingRouteState createState() => _AddShippingRouteState();
}

class _AddShippingRouteState extends State<AddShippingRoute> {
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
                    child: Icon(
                      Icons.arrow_back,
                      size: 24,
                      color: Colors.black,
                    )),

                SizedBox(
                  height: 20,
                ), //common space

                CommonText(
                  text: 'Add Route',
                  size: 24,
                  color: AppColors().black,
                  bold: true,
                ),

                SizedBox(height: 20),

                //data form

                Container(
                  constraints: BoxConstraints(maxWidth: 700),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        CommonText(
                          text: 'Route Title:',
                          size: 17,
                        ),

                        SizedBox(height: 12),

                        CommonTextFieldSmall(
                          controller: _routeTitleController,
                          hintText: 'e.g InterCity',
                        ),

                        SizedBox(
                          height: 20,
                        ), //common space

                         CommonText(
                          text: 'Route Description:',
                          size: 17,
                        ),
                        
                        SizedBox(height: 12),

                        CommonTextFieldSmall(
                          controller: _routeDescriptionController,
                          hintText: '',
                        ),

                        SizedBox(
                          height: 20,
                        ), //common space

                         CommonText(
                          text: 'Currency:',
                          size: 17,
                        ),
                        
                        SizedBox(height: 12),

                        CommonTextFieldSmall(
                          controller: _currencyController,
                          hintText: 'NGN',
                          enabled: false,
                        ),

                        SizedBox(
                          height: 20,
                        ), //common space

                         CommonText(
                          text: 'Unit Price:',
                          size: 17,
                        ),
                        
                        SizedBox(height: 12),

                        CommonTextFieldSmall(
                          controller: _unitPriceController,
                          hintText: '0.00',
                          onlyNumbers: true,
                        ),

                        SizedBox(
                          height: 20,
                        ), //common space

                        //add button

                        Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {

                                if(_routeTitleController.text.isNotEmpty && _routeDescriptionController.text.isNotEmpty && _unitPriceController.text.isNotEmpty) {
                                   
                                    routes.add(
                                     SRoute(_routeTitleController.text, _routeDescriptionController.text, 'NGN', int.parse(_unitPriceController.text))
                                   );

                                   widget.refreshRoutePage(); //so the new category will show on the category page

                                   //clear the data
                                   _routeTitleController.clear();
                                   _routeDescriptionController.clear();
                                   _unitPriceController.clear();

                                   showSnackLong(context, 'Route Added Successfully', false);
                                   Navigator.pop(context);


                                } else {

                                  if(_routeTitleController.text.isEmpty) {

                                    showSnackLong(context, 'Route Title?', true);

                                  } else if(_routeDescriptionController.text.isEmpty) {

                                    showSnackLong(context, 'Route Description?', true);

                                  } else if(_unitPriceController.text.isEmpty) {

                                    showSnackLong(context, 'Unit Price needs to be greater than 0', true);

                                  }




                                  

                                }


                                 


                              },
                              child: CommonTextButtonBig(
                                  text: 'Save Route', textSize: 17),
                            )),

                        SizedBox(
                          height: 20,
                        ),
                      ]),
                )
              ],
            ))));
  }
}

class ProductListWidget extends StatelessWidget {
  final Product product;
  final Function onTap; //add this product to the selectedCategoryProduct list

  const ProductListWidget(
      {Key key, @required this.product, @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 1000,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CommonText(
                    text: product.name,
                    size: 20,
                  ),

                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors().grey),
                        shape: BoxShape.circle,
                        color: selectedCategoryProducts.contains(product)
                            ? AppColors().mainColor.withOpacity(0.5)
                            : Colors.transparent),
                  ),
                ),


                 
                ]),
          ),
        ),

        MyDivider(),
      ],
    );
  }
}



class DummyProductWidget extends StatelessWidget {

  final Product productData;

  const DummyProductWidget({Key key, this.productData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(

       
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
          child: Container(
            width: MediaQuery.of(context).size.width - 70, //this way i am leaving a width of 50px for the forward icon
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
      
                SizedBox(height: 12.5,),
      
                CommonText(
                  text: productData.currency + ' ' + productData.unitPrice.toString(),
                  size: 18,
                  color: AppColors().black,
                ),
                CommonText(
                  text: productData.stockAmount.toString() + ' in stock',
                  size: 18,
                  color: AppColors().grey,
                ),
      
               
      
              ],
            ),
          ),
        ),
      ),
    );
  }
}

