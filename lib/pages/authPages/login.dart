import 'package:dorcashub/general/allExports.dart';
import 'package:dorcashub/pages/authPages/signpage.dart';
import 'package:dorcashub/pages/authPages/video_player.dart';
import 'package:dorcashub/utils/color_utils.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../main.dart';

import 'forgetpassword.dart';


TextEditingController _passwordController = TextEditingController();
TextEditingController _emailController = TextEditingController();
bool remeberMeValue = false;

String email = '';
String password = "";
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
Future checkLogin()async{
  if (_emailController.text== email && _passwordController.text == password){
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("email", _emailController.text);

  }
}

class _LoginPageState extends State<LoginPage> {
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          decoration: BoxDecoration(
                    gradient: LinearGradient(
                    colors: [
                    hexStringToColor("#ffffff"),
                hexStringToColor("#f0f2f5"),

              ],
              begin: Alignment.topLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ Expanded(
              flex: 2,
              child: Padding( padding: const EdgeInsets.symmetric(
                  vertical: 36.0, horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Login",
                      style: TextStyle(
                        color: Colors.black
                        ,
                        fontSize: 40,
                        fontWeight: FontWeight.w800,
                      ),),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Sign in to Continue",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),),
                  ],
                ),
              ),
            ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:
                  [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black)
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "E-mail",
                      ),
                      controller: _emailController,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      obscureText: !_isVisible,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isVisible = !_isVisible;
                            });
                          },
                          icon: _isVisible ? Icon(Icons.visibility, color: Colors.black,) :
                          Icon(Icons.visibility_off, color: Colors.grey,),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black)
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Password",
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      ),
                      controller: _passwordController,
                    ),


                    SizedBox(
                      height: 30,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ForgotPassword()));
                          },
                          child: Align(
                              alignment: Alignment.center,
                              child: CommonText(
                                text: 'Forgot Password?',
                                color: Color(0xff375BE9),
                                size: 15,
                              )),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 30,
                    ),

                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () async {
                          showDialog(context: context,
                              builder: (context){
                            return Center(child: CircularProgressIndicator());
                          },
                          );

                          if (_emailController.text.isNotEmpty &&
                              _passwordController.text.isNotEmpty) {
                            dynamic authorizeData = await ApiRequests()
                                .authorizeViaPassword(
                                _emailController.text,
                                _passwordController.text);


                            //getting the date that access token expires and saving it has a microSecondSinceEpoch int

                            int accessTokenExpiresMicroSecsToEpoch =
                                DateTime.now()
                                    .add(Duration(
                                    seconds:
                                    authorizeData["expires_in"]))
                                    .microsecondsSinceEpoch;

                            authBox.put('accessTokenExpiresIn',
                                accessTokenExpiresMicroSecsToEpoch);
                            authBox.put('accessToken',
                                authorizeData["access_token"]);
                            authBox.put('refreshToken',
                                authorizeData["refresh_token"]);

                            userAccessToken =
                            authorizeData["access_token"];


                            await getDataOnAppStart(); //IMPORTANT

                            showSnackLong(context, 'Logged In', false);

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainApp()));
                          } else {
                            if (_passwordController.text.isEmpty ||
                                _passwordController.text.length < 8) {
                              showSnackLong(
                                  context,
                                  'The password needs to be at least 8 characters long',
                                  true);
                            } else {
                              showSnackLong(
                                  context,
                                  'Please fill all forms correctly',
                                  true);
                            }
                            Navigator.of(context).pop();

                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(color: Color(0xff375BE9),
                              borderRadius: BorderRadius.circular(20),
                            ),

                            child: Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0
                                ),
                              ),
                            ),
                          ),
                        ),


                      ),
                    ),

                   // Padding(
                    //  padding: const EdgeInsets.all(20.0),
                   //   child: Container(
                      //  decoration: BoxDecoration(
                      //      color: Color(0xff375BE9),
                      //      borderRadius:
                      //      BorderRadius.all(Radius.circular(20))),
                       // width: double.infinity,
                      //  child: TextButton(
                      //    onPressed: (){
                      //      Navigator.pushReplacement(
                       //         context,
                       //         MaterialPageRoute(
                        //            builder: (context) => RegisterPage()));
                       //   },
                       //   child: Padding(
                       //     padding: const EdgeInsets.symmetric(vertical: 16.0),
                       //     child: Text(
                         //     "Register",
                         //     style: TextStyle(
                         //         color: Colors.white,
                         ///         fontSize: 16.0
                        // //     ),
                        //    ),
                       //   ),
                      //  ),
                      //),
               //     ),
                    SizedBox(
                      height: 20,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account ",
                            style: TextStyle(color: Colors.black)),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => RegisterPage()));
                          },
                          child: const Text(
                            "Register",
                            style: TextStyle(color: Color(0xff375BE9), fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),

                    SizedBox(
                      height: 100,
                    ),




                  ],
                ),
              )
            ],
          ),
        ),
      ),

    );


  }
}
