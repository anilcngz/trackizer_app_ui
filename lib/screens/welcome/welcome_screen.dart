import 'package:flutter/material.dart';

import 'package:trackizer_app/config/colors.dart';
import 'package:trackizer_app/screens/get_started/get_started_screen.dart';
import 'package:trackizer_app/widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 60.0),
            Image.asset(
              'assets/images/logo.png',
              width: 178,
            ),
            const SizedBox(height: 31.0),
            SizedBox(
              height: size.height * 0.6,
              width: size.width,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    right: -5.0,
                    bottom: -100.0,
                    child: Image.asset('assets/images/welcome_right.png'),
                  ),
                  Image.asset('assets/images/welcome_frame.png'),
                  Positioned(
                    right: 0.0,
                    bottom: 0.0,
                    child: Image.asset('assets/images/welcome_frame_2.png'),
                  ),
                  const Positioned(
                    bottom: 0.0,
                    right: 0.0,
                    left: 0.0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 45.0),
                      child: Text(
                        'Congue malesuada in ac justo, a tristique leo massa. Arcu leo leo urna risus.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0.0,
                    child: Image.asset('assets/images/welcome_left.png'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: CustomButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GetStartedScreen(),
                    ),
                  );
                },
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
                  'Get Started',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: CustomButton(
                onTap: () {},
                mainColor: Colors.white.withOpacity(0.10),
                child: Text(
                  'I have an account',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
