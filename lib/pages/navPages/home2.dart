import 'package:dorcashub/general/allExports.dart';
import 'package:dorcashub/utils/mycard.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class HomePages  extends StatefulWidget {
  const HomePages({Key key}) : super(key: key);

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {

  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children :[
                  CommonText(
                    text: 'Good Morning, ${currentuser.firstName}',
                    size: 19,

                  ),
                    Container(
                      padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(color: Colors.grey[400],
                          shape: BoxShape.circle,
                        ),
                      child: Icon(Icons.add)),

                    SizedBox(height: 25),
                    Container(
                      height: 200,
                      child: PageView(
                        scrollDirection: Axis.horizontal,
                        controller: _controller,
                        children: [
                          MyCards(
                            color: Colors.purple[400],
                          ),
                          MyCards(
                            color: Colors.blue[400],
                          ),
                          MyCards(
                            color: Colors.green[400],
                          ),



                        ],
                      ),
                    ),
                    SizedBox(height: 25,),
                    SmoothPageIndicator(controller: _controller, count: 3,
                    effect: ExpandingDotsEffect(
                      activeDotColor: Colors.grey.shade700,
                    ),
                    ),
                    SizedBox(height: 25,),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 90,
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade400,
                                      blurRadius: 10,
                                      spreadRadius: 2,
                                    )
                                  ]
                                ),

                                child: Center(
                                  child:Image.asset('') ),
                                ),
                            ],
                          ),
                          SizedBox(height:12),
                          CommonOptionContainerType3(
                            title: 'Employees',
                            subText: '${currentuser.company.productCount}',
                            onTap: () {},
                            noArrow: true,
                          ),

                          SizedBox(height:20),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 80,
                                    child: Image.asset(''),
                                  ),
                                  Column(
                                    children: [
                                      Text(''),
                                      Text(''),
                                    ],
                                  )
                                ],
                              )
                            ],
                          )

                        ],
                      ),
                    ),










                  ],


          ),
      ]
      ),
        ),),
    );
  }
}
