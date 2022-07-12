import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:trackizer_app/config/colors.dart';
import 'package:trackizer_app/screens/home/widgets/sub_item.dart';
import 'package:trackizer_app/screens/home/widgets/subscription_item.dart';
import 'package:trackizer_app/screens/home/widgets/subscription_item_date.dart';
import 'package:trackizer_app/screens/subscription_info/subscription_info_screen.dart';
import 'dart:math' as math;

import 'package:trackizer_app/widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
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
        children: [
          CustomPaint(
            foregroundPainter: _RadialGaugePainter(),
            child: Container(
              width: size.width,
              height: size.height * 0.52,
              decoration: BoxDecoration(
                color: kGrey70.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24.0),
                  bottomRight: Radius.circular(24.0),
                ),
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * 0.16),
                  Image.asset(
                    'assets/images/logo.png',
                    width: 107,
                  ),
                  const SizedBox(height: 24.0),
                  Text(
                    NumberFormat.currency(symbol: '\$', decimalDigits: 0)
                        .format(1235)
                        .toString(),
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontSize: 40.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'This month bills',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(color: kGrey40, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 30.0),
                  SizedBox(
                    width: 120.0,
                    height: 32.0,
                    child: CustomButton(
                      onTap: () {},
                      mainColor: Colors.white.withOpacity(0.10),
                      child: Text(
                        'See your budget',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SubItem(
                        size: size,
                        color: kAccentP50,
                        title: 'Active subs',
                        value: '12',
                      ),
                      const SizedBox(width: 8.0),
                      SubItem(
                        size: size,
                        color: kPrimary100,
                        title: 'Highest subs',
                        value: NumberFormat.currency(
                          symbol: '\$',
                          decimalDigits: 2,
                        ).format(19.99).toString(),
                      ),
                      const SizedBox(width: 8.0),
                      SubItem(
                        size: size,
                        color: kAccentS50,
                        title: 'Lowest subs',
                        value: NumberFormat.currency(
                          symbol: '\$',
                          decimalDigits: 2,
                        ).format(5.99).toString(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24.0),
                ],
              ),
            ),
          ),
          const SizedBox(height: 21.0),
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  Container(
                    height: 50.0,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 24.0),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9.0,
                      vertical: 7.0,
                    ),
                    decoration: BoxDecoration(
                      color: kGrey100,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: TabBar(
                      padding: EdgeInsets.zero,
                      indicatorPadding: EdgeInsets.zero,
                      labelPadding: EdgeInsets.zero,
                      indicator: BoxDecoration(
                        color: kGrey60.withOpacity(0.20),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      tabs: [
                        Container(
                          height: 36.0,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 23.0,
                            vertical: 10.0,
                          ),
                          child: Text(
                            'Your subscriptions',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                        Container(
                          height: 36.0,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 23.0,
                            vertical: 10.0,
                          ),
                          child: Text(
                            'Upcoming bills',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: TabBarView(
                        children: [
                          ListView(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            children: [
                              SubscriptionItem(
                                trailingWidget: SvgPicture.asset(
                                  'assets/icons/spotify_logo.svg',
                                  width: 40.0,
                                ),
                                title: 'Spotify',
                                price: 5.99,
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    fullscreenDialog: true,
                                    builder: (context) =>
                                        const SubscriptionInfoScreen(),
                                  ),
                                ),
                              ),
                              SubscriptionItem(
                                trailingWidget: SvgPicture.asset(
                                  'assets/icons/yt_premium_logo.svg',
                                  width: 40.0,
                                ),
                                title: 'YouTube Premium',
                                price: 18.99,
                              ),
                              SubscriptionItem(
                                trailingWidget: SvgPicture.asset(
                                  'assets/icons/onedrive_logo.svg',
                                  width: 40.0,
                                ),
                                title: 'Microsoft OneDrive',
                                price: 29.99,
                              ),
                            ],
                          ),
                          ListView(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            children: const [
                              SubscriptionItem(
                                trailingWidget: SubscriptionItemDate(
                                  day: 25,
                                  month: 'Jun',
                                ),
                                title: 'Spotify',
                                price: 5.99,
                              ),
                              SubscriptionItem(
                                trailingWidget: SubscriptionItemDate(
                                  day: 23,
                                  month: 'Jun',
                                ),
                                title: 'YouTube Premium',
                                price: 18.99,
                              ),
                              SubscriptionItem(
                                trailingWidget: SubscriptionItemDate(
                                  day: 18,
                                  month: 'Jun',
                                ),
                                title: 'Microsoft OneDrive',
                                price: 29.99,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RadialGaugePainter extends CustomPainter {
  // Method to convert degree to radians
  double degToRad(num deg) => deg * (math.pi / 180.0);

  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = kGrey60.withOpacity(0.20)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    final fillLinePaint = Paint()
      ..color = kAccentP100
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2.7;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      degToRad(135.0),
      degToRad(270.0),
      false,
      linePaint,
    );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      degToRad(135.0),
      degToRad(220.0),
      false,
      fillLinePaint,
    );
  }

  @override
  bool shouldRepaint(_RadialGaugePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_RadialGaugePainter oldDelegate) => false;
}
