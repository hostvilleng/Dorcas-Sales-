import 'package:dorcashub/general/allExports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

TextEditingController _customFieldNameController = TextEditingController();

List<Customer> selectedCategoryCustomers = [];

class CustomCustomerField extends StatefulWidget {
  final Function refreshCategoryPage;

  const CustomCustomerField({Key key, this.refreshCategoryPage}) : super(key: key);

  @override
  _CustomCustomerFieldState createState() => _CustomCustomerFieldState();
}

class _CustomCustomerFieldState extends State<CustomCustomerField> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Custom Fields',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors().black,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0,right: 30),
                  child: Text('You can add custom fields to help customize the details you collect from customers',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: AppColors().grey,
                    ),

                  ),
                ),

                SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey.shade400,
                              width: 1,
                            ),
                          ),
                          // width: 410,
                          // height: 50,
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
                              //filled: true,
                              //    fillColor: Colors.grey.shade200,
                              hintText: "Custom Field Name:",
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                            ),
                            controller: _customFieldNameController,
                            textInputAction: TextInputAction.next,
                            inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
                          ),
                        ),
                      ]
                  ),
                ),

                Container(
                  constraints: BoxConstraints(maxWidth: 700),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        //common space

                        CommonText(
                          text: 'Custom Field Name:',
                          size: 17,
                        ),
                        SizedBox(height: 20),

                        Column(
                            children: selectedCategoryCustomers.map((customer) {
                              return DummyCustomerWidget(customerData: customer);
                            }).toList()),

                        SizedBox(
                          height: 20,
                        ), //common space

                        CommonText(
                          text: 'Select Customer to add to this Category:',
                          size: 17,
                        ),
                        SizedBox(height: 20),

                        Column(
                            children: allCustomers.map((e) {
                              return CustomerListWidget(
                                  customer: e,
                                  onTap: () {
                                    if (selectedCategoryCustomers.contains(e)) {
                                      //if the item is ticked remove it
                                      selectedCategoryCustomers.remove(e);
                                      setState(() {

                                      });

                                    } else {
                                      // tick it and add it
                                      selectedCategoryCustomers.add(e);
                                      setState(() {

                                      });

                                    }
                                  });
                            }).toList()),

                        SizedBox(
                          height: 20,
                        ), //common space

                        //add button

                        Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {

                                if(_customFieldNameController.text.length > 0 && _customFieldNameController.text.isNotEmpty) {

                                 // customerCategories.add(
                                 //     CustomerCategory(categoryID: DateTime.now().millisecondsSinceEpoch.toString(), categoryName: _customFieldNameController.text, categoryCustomers: selectedCategoryCustomers)
                               //   );

                                  widget.refreshCategoryPage(); //so the new category will show on the category page

                                  //clear the data
                                  _customFieldNameController.clear();
                                  selectedCategoryCustomers = [];

                                  showSnackLong(context, 'Customer Custom Added', false);
                                  Navigator.pop(context);


                                } else {
                                  showSnackLong(context, 'This Category needs a name please', true);

                                }





                              },
                              child: CommonTextButtonBig(
                                  text: 'Add Custom Field', textSize: 17),
                            )),

                        SizedBox(
                          height: 20,
                        ),
                      ]),
                ),



                //data form



                SizedBox(
                  height: 20,
                ), //common space

                //add button



                SizedBox(
                  height: 20,
                )
              ],
            ))));
  }
}

class CustomerListWidget extends StatelessWidget {
  final Customer customer;
  final Function onTap; //add this product to the selectedCategoryProduct list

  const CustomerListWidget(
      {Key key, @required this.customer, @required this.onTap})
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
                    text: customer.firstName,
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
                          color: selectedCategoryCustomers.contains(customer)
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



class DummyCustomerWidget extends StatelessWidget {

  final Customer customerData;

  const DummyCustomerWidget({Key key, this.customerData}) : super(key: key);

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
                  text: customerData.firstName+ ' ' + customerData.lastName,
                  size: 20,
                  color: AppColors().black,
                  maxLines: 1,
                ),

                SizedBox(height: 12.5,),

                CommonText(
                 text: customerData.email,
                  size: 18,
                  color: AppColors().black,
                ),
                CommonText(
                 text: customerData.phoneNumber.toString(),
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

