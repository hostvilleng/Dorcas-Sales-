import 'package:dorcashub/general/allExports.dart';
import '../../reusable_widgets/reusable_widget.dart';
import '../../utils/color_utils.dart';
import 'package:flutter/material.dart';



class Singin extends StatefulWidget {
  const Singin({Key key}) : super(key: key);

  @override
  State<Singin> createState() => _SinginState();
}

class _SinginState extends State<Singin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              hexStringToColor("#ffffff"),
              hexStringToColor("#f0f2f5"),
              hexStringToColor("#ffffff")
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(

          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.3, 40, 0),

            child: Column(

              children: <Widget>[
                logoWidget("assets/images/logo1.png"),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 8,),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xff375BE9),
                        borderRadius:
                        BorderRadius.all(Radius.circular(20))),
                    width: double.infinity,
                    child: TextButton(
                      onPressed: (){
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 8,),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xff375BE9),
                        borderRadius:
                        BorderRadius.all(Radius.circular(20))),
                    width: double.infinity,
                    child: TextButton(
                      onPressed: (){
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          "Register",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0
                          ),
                        ),
                      ),
                    ),
                  ),
                )//common space

                         ],
                    ),
                  ),




                ),

          ),


    );

  }
}
