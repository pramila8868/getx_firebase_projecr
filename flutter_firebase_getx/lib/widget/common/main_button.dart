import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final enabled;
  final Widget? child;
  final Color? color;
  const MainButton(
      {Key? key,
      this.title = "",
      this.enabled = true,
      this.child,
      this.color,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: SizedBox(
        height: 55,
        child: InkWell(
          onTap: enabled == false ? null : onTap,
          //  onTap: enabled == false ? null : OnTap,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: color ?? Theme.of(context).cardColor),
            width: double.maxFinite,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Center(child: child ?? Text(title)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
