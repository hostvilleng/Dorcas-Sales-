import 'package:flutter/material.dart';
import '../../../reusable_widgets/constants.dart';

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key key,
     this.color,
     this.isActive,
  }) : super(key: key);

  final Color color;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16 / 4),
      decoration: BoxDecoration(
        border: Border.all(color: isActive ? primaryColor  : Colors.transparent),
        shape: BoxShape.circle,
      ),
      child: CircleAvatar(
        radius: 10,
        backgroundColor: color,
      ),
    );
  }
}
