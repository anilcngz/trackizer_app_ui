import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trackizer_app/config/colors.dart';

class InfoItem extends StatelessWidget {
  final String title;
  final String? value;
  final bool isCheckBox;

  const InfoItem({
    Key? key,
    required this.title,
    this.value,
    this.isCheckBox = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.0,
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          if (!isCheckBox) ...[
            Text(
              value!,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: kGrey30,
                  ),
            ),
            SvgPicture.asset('assets/icons/arrow_medium.svg'),
          ],
        ],
      ),
    );
  }
}
