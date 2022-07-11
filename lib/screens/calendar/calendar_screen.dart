import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trackizer_app/config/colors.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final List<Map<String, dynamic>> dayBadges = [
      {
        'day': '08',
        'label': 'Mo',
        'isActive': true,
      },
      {
        'day': '09',
        'label': 'Tu',
        'isActive': false,
      },
      {
        'day': '10',
        'label': 'We',
        'isActive': false,
      },
      {
        'day': '11',
        'label': 'Th',
        'isActive': false,
      },
      {
        'day': '12',
        'label': 'Fr',
        'isActive': false,
      },
      {
        'day': '13',
        'label': 'Sa',
        'isActive': false,
      },
      {
        'day': '14',
        'label': 'Su',
        'isActive': false,
      },
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Spending & Budgets',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 32.0,
              ),
              decoration: BoxDecoration(
                color: kGrey70.withOpacity(0.50),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24.0),
                  bottomRight: Radius.circular(24.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.1),
                  Container(
                    width: size.width / 1.5,
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Text(
                      'Subs Schedule',
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '3 subscriptions for today',
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    color: kGrey30,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 8.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.10),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'January',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              const SizedBox(width: 6.0),
                              SvgPicture.asset('assets/icons/arrow_small.svg'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(7, (index) {
                        final day = dayBadges[index];
                        return Container(
                          height: 103,
                          width: 48.0,
                          margin: EdgeInsets.only(
                            right: index == 9 ? 24.0 : 8.0,
                            left: index == 0 ? 24.0 : 0,
                          ),
                          padding: const EdgeInsets.fromLTRB(
                            10.0,
                            8.0,
                            10.0,
                            16.0,
                          ),
                          decoration: BoxDecoration(
                            color: kGrey60,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Column(
                            children: [
                              Text(
                                day['day'],
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                              Text(
                                day['label'],
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                      color: kGrey30,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              const Spacer(),
                              day['isActive']
                                  ? Container(
                                      height: 6.0,
                                      width: 6.0,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: kAccentP100,
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ],
                          ),
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'January',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                      Text(
                        '01.08.2022',
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: kGrey30,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$24.98',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'in upcoming bills',
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: kGrey30,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            GridView.count(
              padding: const EdgeInsets.all(24.0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                _buildGridItem(
                  context: context,
                  iconName: 'spotify_logo',
                  title: 'Spotify',
                  price: 5.99,
                ),
                _buildGridItem(
                  context: context,
                  iconName: 'yt_premium_logo',
                  title: 'YouTube Premium',
                  price: 18.99,
                ),
                _buildGridItem(
                  context: context,
                  iconName: 'onedrive_logo',
                  title: 'OneDrive',
                  price: 15.99,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem({
    required BuildContext context,
    required String iconName,
    required String title,
    required double price,
  }) {
    return AspectRatio(
      aspectRatio: 160 / 168,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: kGrey60.withOpacity(0.20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'assets/icons/$iconName.svg',
              width: 40.0,
            ),
            const Spacer(),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 5.0),
            Text(
              '\$$price',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
