import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppIconText extends StatelessWidget {
  final Icon icon;
  final Widget text;

  const AppIconText({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        // ignore: prefer_const_constructors
        SizedBox(
          width: 4,
        )
      ],
    );
  }
}
