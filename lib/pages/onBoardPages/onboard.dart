import 'package:carousel_slider/carousel_slider.dart';
import 'package:dorcashub/general/allExports.dart';
import 'package:flutter/cupertino.dart';
import 'package:ionicons/ionicons.dart';

int _currentOnBoardIndex = 0;
CarouselController _mainOnBoardCarouselController = CarouselController();

List<OnBoardWidget> onBoardPages = [
  OnBoardWidget('Welcome To Dorcas Hub', 'The world\'s best booster for small businesses\n\n These are a few of the services we provide for small businesses:', AppIcons().internet),
  OnBoardWidget('Meeting Targets', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer eget vehicula ante, quis egestas tortor. Fusce at ante varius sem placerat malesuada at quis nisl. Phasellus sollicitudin luctus dui, at accumsan leo.', AppIcons().target),
  OnBoardWidget('Publising Content', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer eget vehicula ante, quis egestas tortor. Fusce at ante varius sem placerat malesuada at quis nisl. Phasellus sollicitudin luctus dui, at accumsan leo.', AppIcons().megaphone),
  OnBoardWidget('Grow & Manage Revenue', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer eget vehicula ante, quis egestas tortor. Fusce at ante varius sem placerat malesuada at quis nisl. Phasellus sollicitudin luctus dui, at accumsan leo.', AppIcons().business),
  OnBoardWidget('Monitor Business Analytics Live!', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer eget vehicula ante, quis egestas tortor. Fusce at ante varius sem placerat malesuada at quis nisl. Phasellus sollicitudin luctus dui, at accumsan leo.', AppIcons().marketing),
  OnBoardWidget('Multi Level Marketing', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer eget vehicula ante, quis egestas tortor. Fusce at ante varius sem placerat malesuada at quis nisl. Phasellus sollicitudin luctus dui, at accumsan leo.', AppIcons().level),
];




class MainOnBoard extends StatefulWidget {

  @override
  _MainOnBoardState createState() => _MainOnBoardState();
}

class _MainOnBoardState extends State<MainOnBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            CarouselSlider(
              carouselController:  _mainOnBoardCarouselController,
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.height - 100,
                          viewportFraction: 1,
                          initialPage: 0,
                          enableInfiniteScroll: false,
                          reverse: false,
                          autoPlay: false,
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentOnBoardIndex = index;
                            });
                          }),
                      items: onBoardPages.map((widget) {

                        return BasicOnBoardWidget(widget: widget,);

                      }).toList()
                      ),
                  SizedBox(height: 5),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 100,
                      height: 40,
                      child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(onBoardPages.length, (index) {
                             return Container(
                              width: 7,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentOnBoardIndex == index
                                    ? AppColors().darkGrey
                                    : AppColors().grey,
                              ),
                            );
                          })
                          ),
                    ),
                  ),

          ],

        ),
      ),

    );
  }
}


class BasicOnBoardWidget extends StatelessWidget {

  final OnBoardWidget widget;

  const BasicOnBoardWidget({Key key, this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           SizedBox(height: 70),


                Container(
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors().blandGrey,
                  ),
                  child: CommonSvgIcon(
                    svgDetials: widget.svgIcon,
                    size: 60,
                  ),
                ),


                SizedBox(height: 40),



                 //texts
              Container(
                height: 230,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //tip title
                      CommonText(
                        text: widget.title,
                        size: 25,
                        color: AppColors().black,
                        alignTextCenter: true,
                        bold: true,
                      ),

                      SizedBox(height: 20),

                      //tip description
                      CommonText(
                        text: widget.description,
                        size: 20,
                        color: AppColors().darkGrey,
                        alignTextCenter: true,
                      ),
                    ]),
              ),


              SizedBox(height: 40),


             onBoardPages.last == widget ?

              //main button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  GestureDetector(
                       onTap: () {
                          _mainOnBoardCarouselController.previousPage();
                       },
                                            child: Icon(
                        CupertinoIcons.back,
                        size: 28,
                        color: AppColors().mainColor,
                      ),
                     ),



                  SizedBox(width: 50),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                    },
                    child: Container(
                      width: 200,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        color: AppColors().mainColor,
                      ),
                      child: Center(
                        child: CommonText(
                            text: 'Register',
                            size: 17,
                            color: AppColors().textWhite),
                      ),
                    ),
                  ),
                ],
              )
              
              :

              onBoardPages.first == widget ?
              
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                       onTap: () {
                          _mainOnBoardCarouselController.nextPage();
                       },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 20.0),
                                    child: Icon(
                        CupertinoIcons.forward,
                        size: 28,
                        color: AppColors().mainColor,
                      ),
                                  ),
                ),
              )
              
              :
              
                Align(
                      alignment: Alignment.centerRight,
                                child: Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [



                     GestureDetector(
                       onTap: () {
                          _mainOnBoardCarouselController.previousPage();
                       },
                                            child: Icon(
                        CupertinoIcons.back,
                        size: 28,
                        color: AppColors().mainColor,
                      ),
                     ),


              SizedBox(width: 50),


               GestureDetector(
                       onTap: () {
                          _mainOnBoardCarouselController.nextPage();
                       },
                              child: Padding(
                                    padding: const EdgeInsets.only(right: 20.0),
                                    child: Icon(
                        CupertinoIcons.forward,
                        size: 28,
                        color: AppColors().mainColor,
                      ),
                                  ),
              ),

              
                   ],
                 ),
               ),
        ],
      );
  }
}