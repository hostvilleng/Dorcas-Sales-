import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../reusable_widgets/constants.dart';
import 'addCustomers.dart';

class CustomerButton extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(FontAwesomeIcons.users,
            color: Colors.blueAccent,
            size: 60,),
            SizedBox(
              height: 10,
            ),
            Text(
              'START BY ADDING YOUR CUSTOMERS HERE',
              style: TextStyle(
                color: Colors.blue.shade900,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontFamily: 'pacifico',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Add Customer',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 13.0,
                fontWeight: FontWeight.normal,
                fontFamily: 'SourceSansPro',
                letterSpacing: 2.5,
              ),
            ),
            SizedBox(
              height: 15.0,
              width: 150.0,
              child: Divider(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding, vertical: defaultPadding / 2),
                  child: SizedBox(
                    width: 200,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueAccent,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => AddCustomer()));

                      },
                      child: SvgPicture.asset("assets/icons/Filter.svg"),
                    ),
                  ),
                ),
              ],
            ),


          ],
        ),
      ),
    ),
  );
}
}
