import '../general/allExports.dart';
class MyCards extends StatefulWidget {
  final color;
  const MyCards({Key key,
   @required this.color
  }) : super(key: key);

  @override
  State<MyCards> createState() => _MyCardsState();
}

class _MyCardsState extends State<MyCards> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        width: 300,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.deepPurple[300],
          borderRadius: BorderRadius.circular(16),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10,),
            Text('Business DashBoard',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),),
            SizedBox(height: 20,),
            Text('Dorcas hub is a Platform that helps makes business Easy',
              style: TextStyle(
                color: Colors.white,
              ),),
            SizedBox(height: 10,),
            Row(

            )

          ],
        ),
      ),
    );


  }
}
