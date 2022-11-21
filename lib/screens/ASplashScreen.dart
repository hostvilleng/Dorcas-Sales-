import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'AWalkThroughScreen.dart';

class ASplashScreen extends StatefulWidget {
  const ASplashScreen({Key key}) : super(key: key);

  @override
  _ASplashScreenState createState() => _ASplashScreenState();
}

class _ASplashScreenState extends State<ASplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AWalkThroughScreen()));
    });
  }

  storeASplashScreenInfo()async{
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('ASplashScreen', isViewed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(child: Image.asset( 'image/appetit/logo.png', fit: BoxFit.contain,
            height: 150,
            width: 150, )),

        ],
      ),
    );
  }
}
