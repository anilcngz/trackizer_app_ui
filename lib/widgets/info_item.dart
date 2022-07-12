import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trackizer_app/config/colors.dart';

class InfoItem extends StatelessWidget {
  final String? leadingIcon;
  final String title;
  final String? value;
  final bool isCheckBox;
  final bool isLastItem;

  const InfoItem({
    Key? key,
    required this.title,
    this.value,
    this.isCheckBox = false,
    this.isLastItem = false,
    this.leadingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.0,
      margin: EdgeInsets.only(bottom: isLastItem ? 0.0 : 16.0),
      child: Row(
        children: [
          if (leadingIcon != null) ...[
            SvgPicture.asset(leadingIcon!),
            const SizedBox(width: 20.0),
          ],
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
          ] else ...[
            CupertinoSwitch(
              value: false,
              onChanged: (value) {},
            ),
          ],
        ],
      ),
    );
  }
}
