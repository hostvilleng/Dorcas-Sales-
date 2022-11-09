import 'package:dorcashub/general/allExports.dart';
import 'package:ionicons/ionicons.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
              child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CommonText(
                      text: 'Products',
                      size: 24,
                      color: AppColors().black,
                      bold: true,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Icon(
                      Ionicons.search,
                      size: 24,
                      color: AppColors().mainColor,
                    ),

                    SizedBox(width: 20),

                    Icon(
                      Ionicons.add,
                      size: 24,
                      color: AppColors().mainColor,
                    ),

                      ],
                    )
                  ],
                ),


                SizedBox(height: 20),


                BasicItemWidget(icon: Ionicons.pricetag, title: 'All Products',),
                MyDivider(),
                BasicItemWidget(icon: Ionicons.pricetags, title: 'Collections',),
                MyDivider(),
                BasicItemWidget(icon: Ionicons.gift, title: 'Gift Cards',),
                MyDivider(),
                BasicItemWidget(icon: Ionicons.send, title: 'Transfers',),
                MyDivider(),
                BasicItemWidget(icon: Ionicons.scan, title: 'Inventory Scanner',),
                MyDivider(),

               





              ],
                )
                )
                )
    );
  }
}
