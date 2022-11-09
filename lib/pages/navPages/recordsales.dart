import '../../general/allExports.dart';
import 'package:ionicons/ionicons.dart';

class RecordSales extends StatefulWidget {
  const RecordSales({Key key}) : super(key: key);

  @override
  State<RecordSales> createState() => _RecordSalesState();
}

class _RecordSalesState extends State<RecordSales> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 80.0),
                          child: CommonText(
                            text: 'Record Sales',
                            size: 24,
                            color: AppColors().black,
                            bold: true,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),

                    Column(

                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right:25, left: 25,),
                          child: TextField(
                            decoration: InputDecoration(
                              fillColor: Colors.white24,
                              labelText: "Product Name",
                            ),

                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right:25, left: 25,),
                      child: TextField(
                          decoration: InputDecoration(
                            fillColor: Colors.white24,
                            labelText: "Item",
                          ),
                        ),
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right:25, left: 25,),
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.white24,
                          labelText: "Quantity",
                        ),
                      ),
                    ),







                    MyDivider(),
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: BasicItemWidget(
                        icon: Ionicons.bag_outline,
                        title: 'Orders & Invoices',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ManageOrders()));
                        },
                      ),
                    ),

                    MyDivider(),

                    SizedBox(
                      height: 20,
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Let's take you back",
                              style: TextStyle(color: Colors.black)),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => ManageProducts()));
                            },
                            child: const Text(
                              " Home",
                              style: TextStyle(color: Color(0xff375BE9), fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),

                  ],
                ))));
  }
}
