import 'package:dorcashub/constant.dart';
import 'package:dorcashub/general/allExports.dart';
import 'package:dorcashub/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHeader extends StatefulWidget {
  final String image;
  final String textTop;
  final String textBottom;
  final double offset;
  const MyHeader(
      {Key key, this.image, this.textTop, this.textBottom, this.offset})
      : super(key: key);

  @override
  _MyHeaderState createState() => _MyHeaderState();
}

class _MyHeaderState extends State<MyHeader> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(left: 40, top: 70, right: 20),
        height: 350,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF3383CD),
              Color(0xFF11249F),
            ],
          ),
          image: DecorationImage(
            image: AssetImage("assets/images/virus.png"),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                  Navigator.pop(context);
                  },
                  child: SvgPicture.asset("assets/icons/menu.svg"),
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  'Invoice Summary ',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),

                ),
              ],
            ),
            SizedBox(height: 15),
            Expanded(
              child: Stack(
                children: <Widget>[
                 // Positioned(
                  //  top: (widget.offset < 0) ? 0 : widget.offset,
                   // child: SvgPicture.asset(
                   //   widget.image,
                   //   width: 230,
                    //  fit: BoxFit.fitWidth,
                   //   alignment: Alignment.topCenter,
                  //  ),
                 // ),
                 Positioned(
                    top: 30 - widget.offset / 1,
                    left: 120,
                    child: Text(
                      "${widget.textTop}",
                      style: kHeadingTextStyle.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                 ),
                  SizedBox(
                    height: 5,
                  ),
                  Positioned(
                    top: 50 - widget.offset / 1,
                    left: 80,
                    child: Text(
                      "${widget.textBottom}",
                      style: kHeadingTextStyle.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),

                  Container(), // I dont know why it can't work without container

                ],

              ),

            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyDivider(),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Due By:',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                Text(
                  'Invoice Summary ',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),

                ),
              ],
            ),

          ],

        ),

      ),

    );

  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
