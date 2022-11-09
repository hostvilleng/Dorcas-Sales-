import 'package:dorcashub/general/allExports.dart';
import 'package:flutter/cupertino.dart';

class SRouteProfile extends StatefulWidget {
  final Function refreshRoutePage;
  final SRoute routeData;

  const SRouteProfile(
      {Key key, @required this.routeData, @required this.refreshRoutePage})
      : super(key: key);

  @override
  _SRouteProfileState createState() => _SRouteProfileState();
}

class _SRouteProfileState extends State<SRouteProfile> {
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
                  text: 'Route Data',
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
                        TheHubRichText(commonTexts: [
                          CommonText(
                            text: 'Route Title: ',
                            bold: true,
                            color: AppColors().darkGrey,
                            size: 16,
                          ),
                          CommonText(
                            text: widget.routeData.routeTitle,
                            color: Colors.black,
                            size: 18,
                          ),
                        ]),
                        SizedBox(height: 5),
                        TheHubRichText(commonTexts: [
                          CommonText(
                            text: 'Unit Price: ',
                            bold: true,
                            color: AppColors().darkGrey,
                            size: 16,
                          ),
                          CommonText(
                            text: widget.routeData.currency +
                                ' ' +
                                widget.routeData.unitPrice.toString(),
                            color: Colors.black,
                            size: 18,
                          ),
                        ]),
                        SizedBox(height: 5),
                        TheHubRichText(commonTexts: [
                          CommonText(
                            text: 'Route Description: ',
                            bold: true,
                            color: AppColors().darkGrey,
                            size: 16,
                          ),
                          CommonText(
                            text: widget.routeData.routeDescription,
                            color: Colors.black,
                            size: 18,
                          ),
                        ]),
                        SizedBox(height: 5),
                        SizedBox(
                          height: 40,
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
                                            SizedBox(height: 17), //common space

                                            CommonText(
                                              text: 'WARNING:',
                                              size: 17,
                                              color: Colors.grey,
                                              bold: true,
                                            ),

                                            SizedBox(height: 20), //common space

                                            CommonText(
                                              text:
                                                  'Are you sure you want to delete "${widget.routeData.routeTitle}" Route?',
                                            ),

                                            SizedBox(height: 20), //common space

                                            Align(
                                                alignment: Alignment.center,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    routes.remove(
                                                        widget.routeData);
                                                    widget.refreshRoutePage();

                                                    showSnackLong(context,
                                                        'Route Deleted', true);

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
                                                                Radius.circular(
                                                                    7))),
                                                    child: Padding(
                                                      padding: const EdgeInsets
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
                                    text: 'DELETE ROUTE',
                                    size: 14,
                                    color: Colors.white,
                                    alignTextCenter: true,
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
