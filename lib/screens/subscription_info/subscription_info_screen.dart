import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trackizer_app/config/colors.dart';
import 'package:trackizer_app/widgets/custom_button.dart';
import 'package:trackizer_app/widgets/info_container.dart';
import 'package:trackizer_app/widgets/info_item.dart';

class SubscriptionInfoScreen extends StatelessWidget {
  const SubscriptionInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(24.0),
          height: size.height,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return ClipPath(
                clipper: TicketCustomClipper(),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: constraints.maxWidth,
                          height: constraints.maxHeight * 0.45,
                          padding: const EdgeInsets.symmetric(
                            vertical: 32.0,
                            horizontal: 24.0,
                          ),
                          decoration: const BoxDecoration(
                            color: kGrey60,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24.0),
                              topRight: Radius.circular(24.0),
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    child: SvgPicture.asset(
                                        'assets/icons/arrow_down.svg'),
                                    onTap: () => Navigator.of(context).pop(),
                                  ),
                                  Text(
                                    'Subscription Info',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(color: kGrey30),
                                  ),
                                  SvgPicture.asset('assets/icons/Trash.svg'),
                                ],
                              ),
                              const SizedBox(height: 34.0),
                              SvgPicture.asset(
                                'assets/icons/spotify_logo.svg',
                                width: 106,
                              ),
                              const SizedBox(height: 16.0),
                              Text(
                                'Spotify',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                              Text(
                                '\$5.99',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                      color: kGrey30,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: constraints.maxWidth,
                          height: constraints.maxHeight * 0.55,
                          padding: const EdgeInsets.symmetric(
                            vertical: 24.0,
                            horizontal: 24.0,
                          ),
                          decoration: const BoxDecoration(
                            color: kGrey70,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(24.0),
                              bottomRight: Radius.circular(24.0),
                            ),
                          ),
                          child: Column(
                            children: [
                              const Expanded(
                                child: InfoContainer(
                                  children: [
                                    InfoItem(
                                      title: 'Name',
                                      value: 'Spotify',
                                    ),
                                    InfoItem(
                                      title: 'Description',
                                      value: 'Music app',
                                    ),
                                    InfoItem(
                                      title: 'Category',
                                      value: 'Entertainment',
                                    ),
                                    InfoItem(
                                      title: 'Reminder',
                                      value: 'Never',
                                    ),
                                    InfoItem(
                                      title: 'Currency',
                                      value: 'USD (\$)',
                                      isLastItem: true,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16.0),
                              CustomButton(
                                onTap: () {},
                                mainColor: Colors.white.withOpacity(0.10),
                                child: Text(
                                  'Save',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      left: 0.0,
                      right: 0.0,
                      top: constraints.maxHeight * 0.45,
                      child: DottedBorder(
                        dashPattern: const [5, 10],
                        color: const Color(0xFF131318),
                        padding: EdgeInsets.zero,
                        strokeWidth: 1.0,
                        child: Container(
                          height: 0.0,
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class TicketCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0.0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0.0)
      ..addOval(
        Rect.fromCircle(center: Offset(0.0, size.height * 0.45), radius: 20.0),
      )
      ..addOval(
        Rect.fromCircle(
            center: Offset(size.width, size.height * 0.45), radius: 20.0),
      );

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
