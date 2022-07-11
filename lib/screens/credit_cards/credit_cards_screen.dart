import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trackizer_app/config/colors.dart';
import 'dart:math' as math;

class CreditCardsScreen extends StatelessWidget {
  const CreditCardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Credit Cards',
          style:
              Theme.of(context).textTheme.titleMedium!.copyWith(color: kGrey30),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: GestureDetector(
              onTap: () {},
              child: SvgPicture.asset('assets/icons/Settings.svg'),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 40.0),
          Stack(
            children: [
              Transform.rotate(
                angle: 8 * (math.pi / 180),
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: size.height * 0.42,
                  width: size.width * 0.60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        kGrey60.withOpacity(0.35),
                        kGrey60.withOpacity(0.0),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
              Transform.rotate(
                angle: 4 * (math.pi / 180),
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: size.height * 0.42,
                  width: size.width * 0.60,
                  decoration: BoxDecoration(
                    color: kGrey60.withOpacity(0.75),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        kGrey60,
                        kGrey60.withOpacity(0.0),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
              Container(
                height: size.height * 0.42,
                width: size.width * 0.60,
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF252530),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  children: [
                    SvgPicture.asset('assets/icons/MasterCard_Logo.svg'),
                    const SizedBox(height: 16.0),
                    Text(
                      'Virtual Card',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    Text(
                      'John Doe',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: kGrey20,
                          ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      '**** **** **** 2197',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      '08/28',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 16.0),
                    SvgPicture.asset('assets/icons/Chip.svg'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24.0),
          Text(
            'Subscriptions',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/spotify_logo.svg',
                width: 40.0,
              ),
              const SizedBox(width: 8.0),
              SvgPicture.asset(
                'assets/icons/yt_premium_logo.svg',
                width: 40.0,
              ),
              const SizedBox(width: 8.0),
              SvgPicture.asset(
                'assets/icons/onedrive_logo.svg',
                width: 40.0,
              ),
            ],
          ),
          const SizedBox(height: 48.0),
          Expanded(
            child: Container(
              width: size.width,
              padding: const EdgeInsets.all(24.0),
              alignment: Alignment.topCenter,
              decoration: const BoxDecoration(
                color: kGrey70,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(16.0),
                color: kGrey60,
                child: SizedBox(
                  height: 52.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Add new card',
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: kGrey30,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                      const SizedBox(width: 10.0),
                      SvgPicture.asset('assets/icons/add_circle.svg'),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
