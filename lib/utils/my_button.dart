import '../general/allExports.dart';

class MyButton extends StatefulWidget {
  final String iconImagePath;
  final String buttonText;

  const MyButton({Key key,
    @required this.iconImagePath,
    @required this.buttonText,
  }) : super(key: key);

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {

    return Padding(
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
          ],
        ),

        child: Center(
            child:Image.asset('assets/images/custo.png') ),
      ),
      ],
    ),
    SizedBox(height: 12,),
    Text('Products',
    style: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.black54,
    ),),
    ],
    ));
  }
}
