import 'package:flutter/material.dart';
import 'package:trackizer_app/config/colors.dart';

class SubscriptionItemDate extends StatelessWidget {
  final String month;
  final int day;

  const SubscriptionItemDate({
    Key? key,
    required this.month,
    required this.day,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: 40.0,
      decoration: BoxDecoration(
        color: kGrey70,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            month,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: kGrey30,
                  fontSize: 10.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
          Text(
            day.toString(),
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: kGrey30,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}
