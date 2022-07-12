import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trackizer_app/config/colors.dart';
import 'package:trackizer_app/widgets/custom_button.dart';

class NewSubscriptionScreen extends StatefulWidget {
  const NewSubscriptionScreen({Key? key}) : super(key: key);

  @override
  State<NewSubscriptionScreen> createState() => _NewSubscriptionScreenState();
}

class _NewSubscriptionScreenState extends State<NewSubscriptionScreen> {
  int _selectedPageIndex = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kGrey70.withOpacity(0.50),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: SvgPicture.asset('assets/icons/Back.svg'),
        ),
        title: Text(
          'Credit Cards',
          style:
              Theme.of(context).textTheme.titleMedium!.copyWith(color: kGrey30),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.5,
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              decoration: BoxDecoration(
                color: kGrey70.withOpacity(0.50),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24.0),
                  bottomRight: Radius.circular(24.0),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Add new subscription',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24.0),
                  Expanded(
                    child: PageView.builder(
                      controller: PageController(
                        viewportFraction: 0.55,
                        initialPage: _selectedPageIndex,
                      ),
                      onPageChanged: (index) {
                        setState(() {
                          _selectedPageIndex = index;
                        });
                      },
                      itemCount: subscriptionItemList.length,
                      itemBuilder: (context, index) {
                        final subscriptionItem = subscriptionItemList[index];
                        final scale = _selectedPageIndex == index ? 1.0 : 0.6;
                        return TweenAnimationBuilder(
                          duration: const Duration(milliseconds: 350),
                          tween: Tween(begin: scale, end: scale),
                          curve: Curves.ease,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                subscriptionItem.imageUrl,
                                width: 160.0,
                              ),
                              const SizedBox(height: 24.0),
                              Text(
                                subscriptionItem.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          builder: (
                            BuildContext context,
                            dynamic value,
                            Widget? child,
                          ) {
                            return Transform.scale(
                              scale: value,
                              child: child,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: kGrey50,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  const SizedBox(height: 4.0),
                  const TextField(),
                ],
              ),
            ),
            const SizedBox(height: 24.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 48.0,
                    width: 48.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: kGrey60.withOpacity(0.20),
                    ),
                    child: SvgPicture.asset('assets/icons/Minus.svg'),
                  ),
                  const SizedBox(width: 35.0),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Monthly price',
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: kGrey40,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        TextField(
                          controller: TextEditingController(text: '\$5.99'),
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                fontSize: 24.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: kGrey70,
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 35.0),
                  Container(
                    height: 48.0,
                    width: 48.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: kGrey60.withOpacity(0.20),
                    ),
                    child: SvgPicture.asset('assets/icons/Plus.svg'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 32.0,
              ),
              child: CustomButton(
                onTap: () {},
                mainColor: kAccentP100,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    kWhite.withOpacity(0.0),
                    const Color(0xFFFF7F37).withOpacity(0.5),
                  ],
                ),
                showShadow: true,
                child: Text(
                  'Add this platform',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SubscriptionItem {
  final int id;
  final String imageUrl;
  final String title;

  SubscriptionItem({
    required this.id,
    required this.imageUrl,
    required this.title,
  });
}

List<SubscriptionItem> subscriptionItemList = [
  SubscriptionItem(
    id: 1,
    imageUrl: 'assets/icons/yt_premium_logo.svg',
    title: 'Youtube',
  ),
  SubscriptionItem(
    id: 2,
    imageUrl: 'assets/icons/spotify_logo.svg',
    title: 'Spotify',
  ),
  SubscriptionItem(
    id: 3,
    imageUrl: 'assets/icons/onedrive_logo.svg',
    title: 'OneDrive',
  ),
];
