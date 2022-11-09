import 'package:dorcashub/general/allExports.dart';
import 'package:ionicons/ionicons.dart';

class More extends StatefulWidget {
  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: 'More',
                  size: 24,
                  color: AppColors().black,
                  bold: true,
                ),

                SizedBox(height: 20),

                BasicItemWidget(
                  icon: Ionicons.people_outline,
                  title: 'People',
                ),
                MyDivider(),
                BasicItemWidget(
                  icon: Icons.monetization_on_outlined,
                  title: 'Finance',
                ),
                MyDivider(),
                BasicItemWidget(
                  icon: Ionicons.apps_outline,
                  title: 'Dorcas Apps',
                ),
                MyDivider(),

                SizedBox(height: 20),

              ],
            ))));
  }
}
