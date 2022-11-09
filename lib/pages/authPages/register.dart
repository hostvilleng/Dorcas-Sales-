import 'package:dorcashub/general/allExports.dart';
import '../../main.dart';
import '../../utils/color_utils.dart';


TextEditingController _firstNameController = TextEditingController();
TextEditingController _lastNameController = TextEditingController();
TextEditingController _phoneNumberController = TextEditingController();
TextEditingController _companyNameController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                    Text("Let's Get You Started",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.w800,
                      ),),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Sign up to Continue",
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
              Expanded(flex: 5,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                              hintText: "FirstName",
                              prefixIcon: Icon(
                                Icons.person_outline_outlined,
                                color: Colors.grey[600],
                              )
                          ),
                          controller: _firstNameController,
                        ),
                        SizedBox(
                          height: 10,
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
                              hintText: "LastName",
                              prefixIcon: Icon(
                                Icons.person_outline_outlined,
                                color: Colors.grey[600],
                              )
                          ),
                          controller: _lastNameController,
                        ),

                        SizedBox(
                          height: 10,
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
                              hintText: "Phone No",
                              prefixIcon: Icon(
                                Icons.phone_android_outlined,
                                color: Colors.grey[600],
                              )
                          ),
                          controller: _phoneNumberController,
                        ),
                        SizedBox(
                          height: 10,
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
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Colors.grey[600],
                              )
                          ),
                          controller: _emailController,
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        TextField(
                          //obscureText: true,
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
                              hintText: "Password",
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.grey[600],
                              )
                          ),
                          controller: _passwordController,
                        ),
                        SizedBox(
                          height: 10,
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
                              hintText: "Company / Store Name",
                              prefixIcon: Icon(
                                Icons.local_post_office,
                                color: Colors.grey[600],
                              )
                          ),
                          controller: _companyNameController,
                        ),
                        SizedBox(
                          height: 30,
                        ),

                        Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () async {
                              if (_firstNameController.text.isNotEmpty &&
                                  _lastNameController.text.isNotEmpty &&
                                  _emailController.text.isNotEmpty &&
                                  _phoneNumberController
                                      .text.isNotEmpty &&
                                  _companyNameController
                                      .text.isNotEmpty &&
                                  _passwordController.text.isNotEmpty &&
                                  _passwordController.text.length >= 8) {
                                bool registerResult =
                                await ApiRequests().registerUser(
                                    User(
                                      firstName:
                                      _firstNameController.text,
                                      lastName:
                                      _lastNameController.text,
                                      email: _emailController.text,
                                      phoneNumber:
                                      _phoneNumberController.text,
                                      company: UserCompany(
                                          name: _companyNameController
                                              .text,
                                          productCount: 0,
                                          orderCount: 0,
                                          customerCount: 0),
                                    ),
                                    _passwordController.text);

                                if (registerResult) {
                                  dynamic authorizeData =
                                  await ApiRequests()
                                      .authorizeViaPassword(
                                      _emailController.text,
                                      _passwordController.text);

                                  //getting the date that access token expires and saving it has a microSecondSinceEpoch int

                                  int accessTokenExpiresMicroSecsToEpoch =
                                      DateTime.now()
                                          .add(Duration(
                                          seconds: authorizeData[
                                          "expires_in"]))
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

                                  showSnackLong(context,
                                      'Registration Completed', false);

                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LoginPage()));
                                } else {
                                  showSnackLong(
                                      context,
                                      'There was an issue with the Registration',
                                      true);
                                }
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
                                    "Sign Up",
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
                        SizedBox(
                          height: 15,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an account ",
                                style: TextStyle(color: Colors.black)),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => LoginPage()));
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(color: Color(0xff375BE9), fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),




                      ],
                    ),
                  ),
                ),)
            ],
          ),
        ),
      ),

    );


  }
}