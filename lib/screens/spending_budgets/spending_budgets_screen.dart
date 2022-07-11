import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:trackizer_app/config/colors.dart';
import 'dart:math' as math;

class SpendingBudgetsScreen extends StatelessWidget {
  const SpendingBudgetsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final List<Map<String, dynamic>> categories = [
      {
        'iconPath': 'assets/icons/auto_transport.svg',
        'title': 'Auto & Transport',
        'totalBudget': 400,
        'amountSpent': 125.99,
        'color': kAccentS100,
      },
      {
        'iconPath': 'assets/icons/entertainment.svg',
        'title': 'Entertainment',
        'totalBudget': 600,
        'amountSpent': 150.99,
        'color': kAccentP50,
      },
      {
        'iconPath': 'assets/icons/security.svg',
        'title': 'Security',
        'totalBudget': 600,
        'amountSpent': 205.99,
        'color': kPrimary100,
      },
    ];

    return Scaffold(
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.12),
              CustomPaint(
                foregroundPainter: _RadialGaugePainter(),
                child: SizedBox(
                  width: double.infinity,
                  height: size.height * 0.09,
                  child: Column(
                    children: [
                      Text(
                        NumberFormat.currency(symbol: '\$', decimalDigits: 2)
                            .format(82.97)
                            .toString(),
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                      ),
                      Text(
                        'of \$2,000 budget',
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: kGrey30,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 60,
                width: size.width,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: kGrey60),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Your budgets are on track 👍',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 16),
              ...List.generate(3, (index) {
                final category = categories[index];
                return Container(
                  height: 84.0,
                  width: size.width,
                  margin: const EdgeInsets.only(bottom: 8.0),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 16.0,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: kGrey30.withOpacity(0.15),
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(category['iconPath']),
                          const SizedBox(width: 20.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                category['title'],
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 2.0),
                              Text(
                                '\$${category['totalBudget'] - category['amountSpent']} left to spend',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                      color: kGrey30,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '\$${category['amountSpent']}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'of \$${category['totalBudget']}',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                      color: kGrey30,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      Stack(
                        children: [
                          Container(
                            height: 3.0,
                            width: size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9.0),
                              color: kGrey60,
                            ),
                          ),
                          Container(
                            height: 3.0,
                            width: ((category['totalBudget'] -
                                    category['amountSpent']) *
                                size.width /
                                category['totalBudget']),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9.0),
                              color: category['color'],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }),
              GestureDetector(
                onTap: () => print('add new category'),
                child: DottedBorder(
                  color: kGrey60,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(16.0),
                  child: SizedBox(
                    height: 84.0,
                    width: size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Add new category',
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
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
            ],
          ),
        ),
      ),
    );
  }
}

class _RadialGaugePainter extends CustomPainter {
  // Method to convert degree to radians
  double degToRad(num deg) => deg * (math.pi / 180.0);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 3.5;

    final linePaint = Paint()
      ..color = kGrey60.withOpacity(0.20)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      degToRad(180.0),
      degToRad(180.0),
      false,
      linePaint,
    );

    final fillLinePaint1 = Paint()
      ..color = kAccentS100
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      degToRad(180.0),
      degToRad(20.0),
      false,
      fillLinePaint1,
    );

    final fillLinePaint2 = Paint()
      ..color = kAccentP100
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      degToRad(208.0),
      degToRad(40.0),
      false,
      fillLinePaint2,
    );

    final fillLinePaint3 = Paint()
      ..color = kPrimary10
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      degToRad(256.0),
      degToRad(60.0),
      false,
      fillLinePaint3,
    );
  }

  @override
  bool shouldRepaint(_RadialGaugePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_RadialGaugePainter oldDelegate) => false;
}
