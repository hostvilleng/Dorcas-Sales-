import 'package:dorcashub/general/allExports.dart';
import 'package:dorcashub/jsonToModels/product.dart';
import 'package:flutter/cupertino.dart';

TextEditingController _productNameController = TextEditingController();
TextEditingController _saleCurrencyController =
    TextEditingController(text: 'NGN');
TextEditingController _productPriceController = TextEditingController();
TextEditingController _productAmountController = TextEditingController();
TextEditingController _productDescriptionController = TextEditingController();

class EditProduct extends StatefulWidget {
  final Function refreshProductsPage;
  final Product pastProductData;

  const EditProduct({Key key, @required this.refreshProductsPage, @required this.pastProductData})
      : super(key: key);
  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
   void initState() {
    // TODO: implement initState
    super.initState();

    //filling in the old details
    _productNameController.text = widget.pastProductData.name;
_productPriceController.text = widget.pastProductData.unitPrice.toString();
_productAmountController.text = widget.pastProductData.stockAmount.toString();
_productDescriptionController.text = widget.pastProductData.description;

  }
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
                  text: 'Edit Product',
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
                          text: 'Product Name:',
                          size: 17,
                        ),
                        SizedBox(height: 12),
                        CommonTextFieldSmall(
                          controller: _productNameController,
                          hintText: 'Drink',
                        ),

                        SizedBox(
                          height: 20,
                        ), //common space

                        CommonText(
                          text: 'Sale Currency:',
                          size: 17,
                        ),
                        SizedBox(height: 12),
                        CommonTextFieldSmall(
                          controller: _saleCurrencyController,
                          hintText: '',
                          enabled: false,
                        ),

                        SizedBox(
                          height: 20,
                        ), //common space

                        CommonText(
                          text: 'Product Unit Price:',
                          size: 17,
                        ),
                        SizedBox(height: 12),
                        CommonTextFieldSmall(
                          controller: _productPriceController,
                          hintText: '',
                          onlyNumbers: true,
                        ),

                        SizedBox(
                          height: 20,
                        ), //common space

                        CommonText(
                          text: 'Amount in Stock:',
                          size: 17,
                        ),
                        SizedBox(height: 12),
                        CommonTextFieldSmall(
                          controller: _productAmountController,
                          hintText: '',
                          onlyNumbers: true,
                        ),

                        SizedBox(
                          height: 20,
                        ), //common space

                        CommonText(
                          text: 'Product Description:',
                          size: 17,
                        ),
                        SizedBox(height: 12),
                        CommonTextFieldSmall(
                          controller: _productDescriptionController,
                          hintText: 'A 50cl bottle of drink',
                        ),

                        SizedBox(
                          height: 20,
                        ), //common space

                        //add button

                        Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () async {

                              await ApiRequests().deleteProduct(widget.pastProductData.productId);
                              allProducts.remove(widget.pastProductData);



                                   dynamic productJsonData =
                                    await ApiRequests().addProduct(Product(
                                  name: _productNameController.text,
                                  description:
                                      _productDescriptionController.text,
                                  currency: _saleCurrencyController.text,
                                  unitPrice:
                                      int.parse(_productPriceController.text),
                                  stockAmount:
                                      int.parse(_productAmountController.text),
                                ));

                                allProducts.add(
                                    mainProductJsonDataToProductModel(
                                        productJsonData));

                                widget.refreshProductsPage();

                                _productNameController.clear();
                                _productPriceController.clear();
                                _productAmountController.clear();
                                _productDescriptionController.clear();

                                Navigator.pop(context);
                                Navigator.pop(context);

                                showSnackLong(context,
                                    'Product Edited Sucessfully', false);
                              },
                              child: CommonTextButtonBig(
                                  text: 'Save Product', textSize: 17),
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
