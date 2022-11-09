import 'package:dorcashub/general/allExports.dart';
import 'package:ionicons/ionicons.dart';

class HubSpace extends StatefulWidget {
  @override
  _HubSpaceState createState() => _HubSpaceState();
}

class _HubSpaceState extends State<HubSpace> {
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: 'Your HubSpace',
                          size: 24,
                          color: AppColors().black,
                          bold: true,
                        ),
                        CommonText(
                          text: 'Store Name',
                          size: 20,
                          color: AppColors().mainColor,
                        ),
                      ],
                    ),

                     SizedBox(width: 20),

                    Icon(
                     Icons.arrow_drop_down,
                      size: 24,
                      color: AppColors().mainColor,
                    )
                  ],
                ),


                SizedBox(height: 20),


                BasicItemWidget(icon: Ionicons.people, title: 'Customers',),
                MyDivider(),
                BasicItemWidget(icon: Ionicons.bar_chart, title: 'Analytics',),
                MyDivider(),
                BasicItemWidget(icon: Ionicons.megaphone, title: 'Marketing',),
                MyDivider(),
                BasicItemWidget(icon: Ionicons.pricetags_outline, title: 'Discounts',),
                MyDivider(),
                BasicItemWidget(icon: Ionicons.apps, title: 'Apps',),
                MyDivider(),
                 BasicItemWidget(icon: Ionicons.settings, title: 'Settings',),
                MyDivider(),
                BasicItemWidget(icon: Ionicons.information_circle, title: 'Support',),
                MyDivider(),

                





              ],
                )
                )
                )
    );
  }
}
