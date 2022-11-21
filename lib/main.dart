import 'dart:io';
import 'package:dorcashub/screens/ASplashScreen.dart';
import 'package:dorcashub/screens/AWalkThroughScreen.dart';
import 'package:dorcashub/store/AppStore.dart';
import 'package:dorcashub/utils/AConstants.dart';
import 'package:dorcashub/utils/ADataProvider.dart';
import 'package:dorcashub/utils/AppTheme.dart';
import 'package:dorcashub/utils/partner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:dorcashub/general/allExports.dart';
import 'package:dorcashub/pages/authPages/parentAuth.dart';
import 'package:dorcashub/pages/authPages/signpage.dart';

import 'package:page_transition/page_transition.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'general/allExports.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';

AppStore appStore = AppStore();
//int isViewed;

Box authBox;
int isViewed;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize(aLocaleLanguageList: languageList());

  appStore.toggleDarkMode(value: getBoolAsync(isDarkModeOnPref));
  // Hive.initFlutter(); //IMPORTANT

  defaultToastGravityGlobal = ToastGravity.BOTTOM;

  final appDocDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);
  authBox = await Hive.openBox('authentication');
  HttpOverrides.global = MyHttpOverrides();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('AWalkThroughScreen');
 // var email = preferences.getString('email');


 //await UserSimplePreference.init();

  runApp(MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => MaterialApp(
        debugShowCheckedModeBanner: false,
        //title: 'Docashub${!isMobile ? ' ${platformName()}' : ''}',
        home: isViewed !=0 ? AWalkThroughScreen() : ParentAuth(),
        theme: !appStore.isDarkModeOn ? AppThemeData.lightTheme : AppThemeData.darkTheme,
        navigatorKey: navigatorKey,
        scrollBehavior: SBehavior(),
        supportedLocales: LanguageDataModel.languageLocales(),
        localeResolutionCallback: (locale, supportedLocales) => locale,
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}