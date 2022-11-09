import 'package:dorcashub/general/allExports.dart';

TextEditingController _emailController = TextEditingController();

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,

        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, right:35, top: 30),
              child: Text(
                'Forget Password',
                style: TextStyle(color: Colors.black, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextField(
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              hintText: "Email",
                              prefixIcon: Icon(Icons.mail, size: 30),
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            controller: _emailController,
                          ),

                          SizedBox(
                            height: 40,
                          ),

                          //  GestureDetector(
                          //      onTap: () {
                          //        Navigator.pop(context);
                          //      },
                          //      child: Icon(Icons.arrow_back, size: 24, color: Colors.black,)),

                          //      SizedBox(height: 20,), //common space

                          // Row(
                          //   children: [
                          //     Container(
                          //       width: 50,
                          //       height: 50,
                          //       decoration: BoxDecoration(
                          //         border: Border.all(width: 2, color: Colors.black),
                          //         image: DecorationImage(
                          //           image: AssetImage('assets/images/logo_dorcas.png'),
                          //           fit: BoxFit.fill,
                          //         ),
                          //       ),
                          //     ),
                          //     Column(
                          //       children: [
                          //         CommonText(
                          //           text: 'DORCAS',
                          //           bold: true,
                          //         ),
                          //         CommonText(
                          //           text: 'Your Business OS',
                          //           size: 17,
                          //         ),
                          //       ],
                          //     ),
                          //   ],
                          // ),

                          //login form

                          //common space
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()));
                                },
                                child: Align(
                                    alignment: Alignment.center,
                                    child: CommonText(
                                      text: 'Return to Login?',
                                      color: AppColors().mainColor,
                                      size: 15,
                                    )),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 40,
                          ),

                          //login button

                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xff375BE9),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 70, vertical: 10),
                              child: CommonText(
                                text: 'Reset',
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 30,
                          ),

                          Align(
                            alignment: Alignment.center,
                            child: CommonText(
                              text:
                                  'The Hub is a FREE all-in-one platform that helps you automate your business e-commerce sales, finance, payroll, customer management and much more',
                              size: 15,
                              color: Colors.grey.shade900,
                              alignTextCenter: true,
                            ),
                          ),

                          //common space
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

    );
  }
}
