import '../../general/allExports.dart';
import 'package:ionicons/ionicons.dart';

import '../otherPages/sales/product_button.dart';


class ProdutsPage extends StatefulWidget {
  const ProdutsPage({Key key}) : super(key: key);

  @override
  State<ProdutsPage> createState() => _ProdutsPageState();
}

class _ProdutsPageState extends State<ProdutsPage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(

          child: Column(
            children: [
              Container(
                height: 50,
              ),

              Container(
                height: 48,
                width: 300,
                decoration: BoxDecoration(
                    color: Color(0xFF292639),
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: TabBar(
                    indicator: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    tabs: [
                      Tab(text: "Products",

                      ),
                      Tab(text: "Manage Products"
                      ),
                      Tab(text: "Product Categories"
                      ),
                    ],
                  ),

                ),

              ), SizedBox(
                height: 10,
              ),


              SizedBox(
                height: 650,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TabBarView(children: [
                    Container(child: Center(
                      child: ProductButton(
                      ),

                    )),
                    SizedBox(
                      height: 650,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(child: ManageProducts(
                        ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 650,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(child: ProductCategories(
                        ),
                        ),
                      ),
                    ),


                  ],

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
