import 'package:dorcashub/general/allExports.dart';
import 'package:dorcashub/pages/authPages/video_player.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';


SharedPreferences LocalStorage;
//TextEditingController _passwordController = TextEditingController();
//TextEditingController _emailController = TextEditingController();
TextEditingController _patnerNameController = TextEditingController();
//TextEditingController _businessServerNameController = TextEditingController();

//list of host servers

//String _selectedHostName = 'Dorcas Hub';
//List<String> serverNames = ['GT Bank', 'Dorcas Hub','Smart Tech'];

class ParentAuth extends StatefulWidget {

  static Future inti() async{
    //localStorage =await SharedPreferences.getInstance();
  }
  @override
  _ParentAuthState createState() => _ParentAuthState();
}

class _ParentAuthState extends State<ParentAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 140),
            //    Icon(Icons.person_outline_outlined,
            //        color: Colors.grey.shade300, size: 140),
                //common space

                SizedBox(
                  height: 20,
                ), //common space

                //Align(
                  //  alignment: Alignment.center,
                  //  child: Text(
                   //   'Welcome',
                 //     style: TextStyle(
                    //    fontSize:35,
                     //   fontWeight: FontWeight.bold,
                     //   color: Colors.blueAccent,
                    //    fontFamily: 'Montserrat',
                    //    letterSpacing: 2.5,

                   //   ),
                  //  )),
               // Text(
               //   "Sign in to continue",
                //  style: TextStyle(
                //    fontSize: 18,
                 //   fontWeight: FontWeight.w500,
                 //   color: Colors.grey.shade900,
                //  ),
              //  ),

                SizedBox(
                  height: 10,
                ), //common space

                //login form

                Container(
                  constraints: BoxConstraints(maxWidth: 700),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                       "Enter Partner's ID",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          //fontFamily: 'Montserrat',
                        ),
                      ),
                    //  SizedBox(height: 4),
                     // CommonDropDown(
                       //   options: serverNames,
                       //   currentValue: _selectedHostName,
                      //    onChanged: (v) {
                       //     setState(() {
                        //      _selectedHostName = v;
                       //     });
                      //    }),

                      SizedBox(
                        height: 40,
                      ), //common space

                      Container(
                        child: TextFormField(
                          textInputAction: TextInputAction.newline,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            //hintText: "Short Description:",
                            labelText: "Partner's Name:",
                            labelStyle: TextStyle(fontSize: 12,color: Colors.black),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13)
                            ),
                          ),

                          // minLines: null,
                          //maxLines: null,
                          // If this is null, there is no limit to the number of lines, and the text container will start with enough vertical space for one line and automatically grow to accommodate additional lines as they are entered.
                          //expands:
                          //true, // If
                          controller: _patnerNameController,
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ), //common space

                      SizedBox(height: 50),
                      //Container(
                      //  child: TextFormField(
                        //  obscureText: true,
                        //  textInputAction: TextInputAction.newline,
                         // keyboardType: TextInputType.multiline,
                         // decoration: InputDecoration(
                            //hintText: "Short Description:",
                          //  labelText: 'Password:',
                           // labelStyle: TextStyle(fontSize: 12,color: Colors.blueAccent),
                           // border: OutlineInputBorder(
                           //     borderRadius: BorderRadius.circular(13)
                          //  ),
                          //),

                          // minLines: null,
                          //maxLines: null,
                          // If this is null, there is no limit to the number of lines, and the text container will start with enough vertical space for one line and automatically grow to accommodate additional lines as they are entered.
                          //expands:
                          //true, // If
                       //   controller: _passwordController,
                      //  ),
                     // ),

                      //common space
                      //Row(
                        //mainAxisAlignment: MainAxisAlignment.end,
                        //children: [
                          //TextButton(
                            //onPressed: () {},
                            //child: Text(
                              //"Forgot Password?",
                             // style: TextStyle(
                              //  fontSize: 13,
                                //fontWeight: FontWeight.bold,
                              //  color: Colors.blue,
                             // ),
                          //  ),
                       //   ),
                        //],
                     // ),

                      SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                      ),

                      //login button

                      Align(
                          alignment: Alignment.bottomCenter,
                          child: GestureDetector(
                            onTap: () async {
                              showDialog(context: context,
                                builder: (context){
                                  return Center(child: CircularProgressIndicator());
                                },
                              );

                              if (_patnerNameController.text.isNotEmpty) {
                                dynamic createHubData = await ApiRequests()
                                    .createHub(
                                    slug:_patnerNameController.text,);


                                //getting the date that access token expires and saving it has a microSecondSinceEpoch int

                                int accessTokenExpiresMicroSecsToEpoch =
                                    DateTime.now()
                                        .add(Duration(
                                        seconds:
                                        createHubData["expires_in"]))
                                        .microsecondsSinceEpoch;

                                authBox.put('accessTokenExpiresIn',
                                    accessTokenExpiresMicroSecsToEpoch);
                                authBox.put('accessToken',
                                    createHubData["access_token"]);
                                authBox.put('refreshToken',
                                    createHubData["refresh_token"]);

                                userAccessToken =
                                createHubData["access_token"];

                                await getDataOnAppStart(); //IMPORTANT

                                showSnackLong(context, 'Logged In', false);

                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => VideoPlayerPage()));
                              }
                              //else {
                                //if (_passwordController.text.isEmpty ||
                                  //  _passwordController.text.length < 8) {
                                 // showSnackLong(
                                     // context,
                                     // 'The password needs to be at least 8 characters long',
                                   //   true);
                              //  }
                                //else {
                                 // showSnackLong(
                                   //   context,
                                    //  'Please fill all forms correctly',
                                   //   true);
                               // }
                               // Navigator.of(context).pop();

                            //  }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 20),
                                child: Text(
                                   'Login', style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                ),

                                ),
                              ),
                            ),
                          )),

                      SizedBox(height: 8),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have any account ?",
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {

                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegisterPage()));

                            },
                            child: Align(
                                alignment: Alignment.center,
                                child: CommonText(
                                  text: 'Register',
                                  color: AppColors().mainColor,
                                  size: 15,
                                )),
                          ),

                        ],
                      ),

                      SizedBox(
                        height: 15,
                      ),

                     // if (localStorage !=null)
                        //Text("User Login in !!! ==> Email Id:"),



                      // SizedBox(
                      //     height: 15,
                      //   ),

                      //Padding(
                       // padding: const EdgeInsets.only(right:8.0, left:15),
                       // child: Align(
                         // alignment: Alignment.center,
                         // child: Text(
                             //   'The Hub is a FREE all-in-one platform that helps you automate your business e-commerce sales, finance, payroll, customer management and much more',
                            //style: TextStyle(
                            //  fontSize: 13,
                           //   color: Colors.grey.shade900,


                         //   ),
                        //  ),
                       // ),
                     // ),

                      SizedBox(
                        height: 30,
                      ), //common space
                    ],
                  ),
                ),

                //bottom info that should be in most important pages
                //BottomInfo(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
