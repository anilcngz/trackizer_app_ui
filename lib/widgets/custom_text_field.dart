import 'package:flutter/material.dart';
import 'package:trackizer_app/config/colors.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  final bool isObscure;
  final void Function(String)? onChanged;

  const CustomTextField({
    Key? key,
    required this.title,
    this.controller,
    this.isObscure = false,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style:
              Theme.of(context).textTheme.labelMedium!.copyWith(color: kGrey50),
        ),
        const SizedBox(height: 4.0),
        TextField(
          controller: controller,
          obscureText: isObscure,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
