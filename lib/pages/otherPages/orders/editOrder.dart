import 'package:dorcashub/general/allExports.dart';
import 'package:dorcashub/jsonToModels/order.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

TextEditingController _invoiceTitleController = TextEditingController();
TextEditingController _invoiceDescriptionController = TextEditingController();
TextEditingController _invoiceDueDateController = TextEditingController();

DateTime _invoiceDueDate;
bool _invoiceReminderValue;

class EditOrder extends StatefulWidget {
  final Order pastOrderData;

  const EditOrder({Key key, @required this.pastOrderData}) : super(key: key);

  @override
  _EditOrderState createState() => _EditOrderState();
}

class _EditOrderState extends State<EditOrder> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //filling in the old details
    _invoiceTitleController.text = widget.pastOrderData.invoiceTitle;
    _invoiceDescriptionController.text =
        widget.pastOrderData.invoiceDescription;
    _invoiceDueDate = widget.pastOrderData.invoiceDueDate == null ? DateTime.now() : widget.pastOrderData.invoiceDueDate;
    _invoiceDueDateController.text =
        DateFormat('EEE, M/d/y').format(_invoiceDueDate);
    _invoiceReminderValue = widget.pastOrderData.reminderOn;
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
                  text: 'Edit Order',
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
                          text: 'Title:',
                          size: 17,
                        ),

                        SizedBox(height: 12),

                        CommonTextFieldSmall(
                          controller: _invoiceTitleController,
                          hintText: 'Drink Order',
                        ),

                        SizedBox(
                          height: 20,
                        ), //common space

                        CommonText(
                          text: 'Description:',
                          size: 17,
                        ),

                        SizedBox(height: 12),

                        CommonTextFieldSmall(
                          controller: _invoiceDescriptionController,
                          hintText: '',
                        ),

                        SizedBox(
                          height: 20,
                        ), //common space

                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _invoiceDueDateController.text =
                                  DateFormat('EEE, M/d/y')
                                      .format(_invoiceDueDate);
                            });
                            // Show the modal that contains the CupertinoDatePicker

                            showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30.0),
                                    topRight: Radius.circular(30.0),
                                  ),
                                ),
                                context: context,
                                builder: (BuildContext context) {
                                  return StatefulBuilder(builder: (BuildContext
                                          context,
                                      StateSetter
                                          setState /*You can rename this!*/) {
                                    return CommonBottomSheetMobile(
                                      heightPercentage: 0.8,
                                      widgets: [
                                        SizedBox(height: 15), //common space

                                        CommonText(
                                          text: 'Invoice Due By:',
                                          size: 17,
                                        ),

                                        SizedBox(height: 17), //common space

                                        Container(
                                          height: 300,
                                          child: CupertinoDatePicker(
                                              mode:
                                                  CupertinoDatePickerMode.date,
                                              initialDateTime: _invoiceDueDate,
                                              onDateTimeChanged: (val) {
                                                _invoiceDueDate = val;

                                                _invoiceDueDateController.text =
                                                    DateFormat('EEE, M/d/y')
                                                        .format(_invoiceDueDate);

                                                setState(() {});
                                              }),
                                        ),

                                        // Close the modal
                                        Center(
                                          child: CupertinoButton(
                                            child: CommonText(
                                              text: 'OK',
                                            ),
                                            onPressed: () =>
                                                Navigator.of(context).pop(),
                                          ),
                                        )
                                      ],
                                      topWidgets: [
                                        Center(
                                            child:
                                                roundedModalSheetTopSitter()),

                                        SizedBox(height: 17), //common space

                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(),
                                            CancelBottomSheetButton(
                                              onTapped: () =>
                                                  Navigator.pop(context),
                                            ),
                                          ],
                                        ),
                                      ],
                                      refreshMe: () => setState(() {}),
                                    );
                                  });
                                });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(
                                text: 'Due Date:',
                                size: 17,
                              ),
                              SizedBox(height: 12),
                              CommonTextFieldSmall(
                                controller: _invoiceDueDateController,
                                hintText: 'Tap to set...',
                                enabled: false,
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 20), //common space

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              value: _invoiceReminderValue,
                              onChanged: (newValue) {
                                setState(() {
                                  _invoiceReminderValue = newValue;
                                });
                              },
                              activeColor: AppColors().mainColor,
                            ),
                            CommonText(
                              text: 'Invoice Reminder (On)',
                              size: 15,
                              color: Colors.grey,
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 20,
                        ), //common space

                        //add button

                        Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () async{
                                if (_invoiceTitleController.text.isNotEmpty && _invoiceDescriptionController.text.isNotEmpty && _invoiceDueDateController.text.isNotEmpty) {
                                  //remove the past order and add the new one

                                  invoices.remove(widget.pastOrderData);
                                  print(widget.pastOrderData.amountOrdered);

                                                      dynamic orderJsonData = await ApiRequests().editOrder(
                                         Order(
                                      product: widget.pastOrderData.product,
                                      customer: widget.pastOrderData.customer,
                                      invoiceId: widget.pastOrderData.invoiceId,
                                      invoiceTitle: _invoiceTitleController.text,
                                      invoiceDescription: _invoiceDescriptionController.text,
                                      currency: widget.pastOrderData.currency,
                                      amountOrdered: widget.pastOrderData.amountOrdered,
                                      reminderOn: _invoiceReminderValue,
                                      invoiceDueDate: _invoiceDueDate,
                                      invoiceDateCreated: widget.pastOrderData.invoiceDateCreated,
                                      paidFor: widget.pastOrderData.paidFor)
                                     );

                                  invoices.add(mainOrderJsonDataToOrderModel(orderJsonData));

                                  refreshOrdersPage(); //so the new category will show on the category page

                                  //clear the data
                                      _invoiceTitleController.clear();
                                      _invoiceDescriptionController.clear();
                                      _invoiceDueDateController.clear();
                                      _invoiceDueDate = DateTime.now();
                                      _invoiceReminderValue = false;

                                  showSnackLong(context, 'Order Edited', false);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                } else {
                                  showSnackLong(context,
                                      'Please fill all the forms', true);
                                }
                              },
                              child: CommonTextButtonBig(
                                  text: 'Save Order', textSize: 17),
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
