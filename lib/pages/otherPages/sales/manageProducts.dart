import 'package:dorcashub/general/allExports.dart';
import 'package:flutter/cupertino.dart';
//import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;
//import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';


Function refreshProductsPage;

class ManageProducts extends StatefulWidget {
  @override
  _ManageProductsState createState() => _ManageProductsState();
}

class _ManageProductsState extends State<ManageProducts> {
  Future _qrScanner() async {
    var cameraStatus = await Permission.camera.status;
    if (cameraStatus.isGranted) {
      String qrdata = await scanner.scan();
    }else{
      var isGrant = await Permission.camera.request();
      if (isGrant.isGranted){
        String qrdata = await scanner.scan();
      }
    }
  }
  @override
  Widget build(BuildContext context) {

    refreshProductsPage = () {

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
                       'Manage Product',
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       color: AppColors().black,
                       fontSize: 16
                     ),
                    ),
                 ],
               ),
                
                SizedBox(height: 20),

                 Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     IconButton(
                       iconSize: 40,
                       icon: Icon(Ionicons.scan_outline,
                         color: Colors.blueAccent,), onPressed: () {  _qrScanner();

                     },

                     ),
                     SizedBox(
                       width: 1,
                     ),
                     Text(
                       ' Scan Product:',
                       style: TextStyle(
                         color: AppColors().darkGrey,
                         fontWeight: FontWeight.bold,
                         fontSize: 13,
                       ),

                     ),
                     SizedBox(
                       width: 6,
                     ),

                   //  Align(
                     //  alignment: Alignment.centerRight,
                      // child: CommonTextButton(text: 'Add Product',
                      // onTapped: () {
                        //  Navigator.push(
                          //          context,
                      //              MaterialPageRoute(
                      //                  builder: (context) => AddProduct(refreshProductsPage:  refreshProductsPage,)));
                     //  },
                     //  )
                    // ),

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
                        ' Product List:',
                          style: TextStyle(
                            color: AppColors().darkGrey,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),

                        ),
                        
                        SizedBox(
                          height: 20,
                        ),

                        Column(
                           children: allProducts.map((product) {
                               return ProductWidget(productData: product);
                           }).toList()

                           
                        ),

                       
                      ]),
                )
              ],
            ))));
  }
}


class ProductWidget extends StatelessWidget {

  final Product productData;

  const ProductWidget({Key key, this.productData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(

        onTap: () {

          Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductProfile(productData: productData)));
          

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
                      size: 14,
                      color: AppColors().grey,
                    ),
      
                    SizedBox(height: 12.5,),
      
                    CommonText(
                      text: 'Tap for more info',
                      size: 14,
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
