import 'package:dorcashub/general/allExports.dart';

import 'package:dorcashub/pages/authPages/video_player.dart';
import 'package:dorcashub/pages/otherPages/settings/business.dart';
import 'package:dorcashub/pages/otherPages/settings/personal.dart';
import 'package:ionicons/ionicons.dart';

class SettingsPage extends StatefulWidget {


  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 40,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                              child: Text(
                                'Settings',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: AppColors().black,
                                  fontWeight: FontWeight.bold,
                                ),

                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),

                      ],
                    ),

                  ],
                ),

                MyDivider(),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: BasicItemWidget(
                    icon: Ionicons.person_outline,
                    title: 'Personal',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PersonalSettings()));
                    },
                  ),
                ),
                MyDivider(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: BasicItemWidget(
                    icon: Ionicons.information_outline,
                    title: 'Take a Tour',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VideoPlayerPage()));
                    },
                  ),
                ),
                 MyDivider(),
                //Padding(
                  //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  //child: BasicItemWidget(
                    //ic//e: 'Business Info',
                    //onTap: () {
                      //Navigator.push(
                       //   context,
                        //  MaterialPageRoute(
                        //      builder: (context) => PersonalSettingse()));
                   // },
                 // ),
                //),
                // BasicItemWidget(icon: Ionicons.bar_chart_outline, title: 'Business',),
                // MyDivider(),
                 Padding(
                   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                   child: BasicItemWidget(icon: Ionicons.lock_closed_outline, title: 'Security', onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => SecuritySettings()));
                   },),
                 ),
                // MyDivider(),
                // BasicItemWidget(icon: Ionicons.lock_open_outline, title: 'Permissions',),
                // MyDivider(),
                // BasicItemWidget(icon: Ionicons.power_outline, title: 'Setup & Features',),
                // MyDivider(),
                MyDivider(),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: BasicItemWidget(
                    icon: Ionicons.log_out_outline,
                    title: 'Logout',
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
                                (BuildContext context, StateSetter setState) {
                              return CommonBottomSheetMobile(
                                heightPercentage: 0.45,
                                refreshMe: () => setState(() {}),
                                topWidgets: [
                                  Center(child: roundedModalSheetTopSitter()),
                                ],
                                widgets: [
                                  SizedBox(height: 17), //common space

                                  Text('WARNING:',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),

                                  ),

                                  SizedBox(height: 20), //common space

                                  Text(
                                        'Are you sure you want to LogOut from the DorcasHub?',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,

                                    ),
                                  ),

                                  SizedBox(height: 20), //common space

                                  Align(
                                      alignment: Alignment.center,
                                      child: GestureDetector(
                                        onTap: () async {
                                          await logoutThisUser(context);

                                          Navigator.pop(context);
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginPage()));

                                          showSnackLong(context, 'User Loggged Out', true);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: AppColors().red,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(7))),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 40, vertical: 10),
                                            child: CommonText(
                                              text: 'LOGOUT',
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
                                              color: AppColors().mainColor,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(7))),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 40, vertical: 10),
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
                  ),
                ),
              ],
            ))));
  }
}
