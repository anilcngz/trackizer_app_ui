import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.child,
    required this.onTap,
    required this.mainColor,
    this.gradient,
    this.showShadow = false,
  }) : super(key: key);

  final Widget child;
  final Function() onTap;
  final Color mainColor;
  final bool showShadow;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.circular(999),
          boxShadow: showShadow
              ? [
                  BoxShadow(
                    offset: const Offset(0.0, 8.0),
                    blurRadius: 25.0,
                    color: mainColor.withOpacity(0.5),
                  ),
                ]
              : [],
        ),
        child: Container(
          width: double.infinity,
          height: 48.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(999),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.5),
                blurRadius: showShadow ? 3.0 : 1.0,
                blurStyle: BlurStyle.outer,
                spreadRadius: -1,
                offset: const Offset(0, 0),
              )
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}
