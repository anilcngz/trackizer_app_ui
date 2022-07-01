import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trackizer_app/config/colors.dart';
import 'package:trackizer_app/screens/register/register_screen.dart';
import 'package:trackizer_app/widgets/custom_button.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
          25.0,
          58.0,
          25.0,
          38.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 146,
            ),
            const Spacer(),
            CustomButton(
              onTap: () {},
              mainColor: Colors.black,
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.topCenter,
                colors: [
                  Colors.white.withOpacity(0.0),
                  Colors.black.withOpacity(0.25),
                ],
              ),
              showShadow: true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/Apple.svg'),
                  const SizedBox(width: 8.0),
                  Text(
                    'Sign up with Apple',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            CustomButton(
              onTap: () {},
              mainColor: Colors.white,
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.topCenter,
                colors: [
                  Colors.white.withOpacity(0.0),
                  Colors.white.withOpacity(0.50),
                ],
              ),
              showShadow: true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/Google.svg'),
                  const SizedBox(width: 8.0),
                  Text(
                    'Sign up with Google',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: kGrey80, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            CustomButton(
              onTap: () {},
              mainColor: const Color(0xFF1771E6),
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.topCenter,
                colors: [
                  Colors.white.withOpacity(0.0),
                  const Color(0xFF1771E6).withOpacity(0.50),
                ],
              ),
              showShadow: true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/Facebook.svg'),
                  const SizedBox(width: 8.0),
                  Text(
                    'Sign up with Facebook',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40.0),
            Text(
              'or',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 40.0),
            CustomButton(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegisterScreen(),
                ),
              ),
              mainColor: Colors.white.withOpacity(0.10),
              child: Text(
                'Sign up with E-mail',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 24.0),
            Text(
              'By registering, you agree to our Terms of Use. Learn how we collect, use and share your data.',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.w500, color: kGrey50),
            ),
          ],
        ),
      ),
    );
  }
}
