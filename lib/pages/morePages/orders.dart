import 'package:dorcashub/general/allExports.dart';
import 'package:dorcashub/pages/otherPages/sales/addOrder.dart';
import 'package:ionicons/ionicons.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
              child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CommonText(
                      text: 'Orders',
                      size: 24,
                      color: AppColors().black,
                      bold: true,
                    ),
                    Icon(
                      Ionicons.add,
                      size: 24,
                      color: AppColors().mainColor,
                    ),
                  ],
                ),


                SizedBox(height: 70),


                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors().blandGrey,
                  ),
                  child: CommonSvgIcon(
                    svgDetials: AppIcons().box,
                    size: 60,
                  ),
                ),


                SizedBox(height: 40),



                 //texts
              Container(
                height: 150,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //tip title
                      CommonText(
                        text: 'Manage Your Orders',
                        size: 25,
                        color: AppColors().black,
                        alignTextCenter: true,
                        bold: true,
                      ),

                      SizedBox(height: 20),

                      //tip description
                      CommonText(
                        text: 'You\'ll get notified when you recieve your first order',
                        size: 20,
                        color: AppColors().darkGrey,
                        alignTextCenter: true,
                      ),
                    ]),
              ),


              SizedBox(height: 20),

              //main button
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddOrder(refreshOrdersPage: refreshOrdersPage)));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    width: 1000,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      color: AppColors().mainColor,
                    ),
                    child: Center(
                      child: CommonText(
                          text: 'CREATE ORDER',
                          size: 14,
                          color: AppColors().textWhite),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),

              //learn more button
              CommonText(
                text: 'LEARN MORE',
                size: 14,
                color: AppColors().simpleBlue,
                alignTextCenter: true,
              ),


              ]),
        ),
      ),
    );
  }
}
