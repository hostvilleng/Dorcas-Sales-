import 'package:dorcashub/general/allExports.dart';
import 'package:dorcashub/pages/otherPages/sales/addShippingRoute.dart';
import 'package:dorcashub/pages/otherPages/shippingRoutes/sRoutesProfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

List<SRoute> routes = [];

Function refreshRoutePage;

class ManageRoutes extends StatefulWidget {
  @override
  _ManageRoutesState createState() => _ManageRoutesState();
}

class _ManageRoutesState extends State<ManageRoutes> {
  @override
  Widget build(BuildContext context) {

  refreshRoutePage = () {
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
                  text: 'Manage Route',
                  size: 24,
                  color: AppColors().black,
                  bold: true,
                ),

                SizedBox(height: 20),

                Align(
                    alignment: Alignment.centerRight,
                    child: CommonTextButton(
                      text: 'Add Route',
                      onTapped: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddShippingRoute(
                                      refreshRoutePage: () {
                                        setState(() {});
                                      },
                                    )));
                      },
                    )),

                SizedBox(height: 20),

                //data form

                Container(
                  constraints: BoxConstraints(maxWidth: 700),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: 'Your Routes:',
                          bold: true,
                          color: AppColors().darkGrey,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                            children: routes.map((route) {
                          return SRouteWidget(routeData: route);
                        }).toList())
                      ]),
                )
              ],
            ))));
  }
}

class SRouteWidget extends StatelessWidget {
  final SRoute routeData;

  const SRouteWidget({Key key, this.routeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SRouteProfile(routeData: routeData, refreshRoutePage: refreshRoutePage))
                                    );
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
                    CommonTextWithMaxLines(
                      text: routeData.routeTitle,
                      size: 20,
                      color: AppColors().black,
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 12.5,
                    ),
                    CommonText(
                      text: 'Unit Price:' +
                          routeData.currency +
                          ' ' +
                          routeData.unitPrice.toString(),
                      size: 18,
                      color: AppColors().grey,
                    ),
                    SizedBox(
                      height: 12.5,
                    ),
                    CommonText(
                      text: 'Tap for more info',
                      size: 15,
                      color: AppColors().blueAcc,
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
