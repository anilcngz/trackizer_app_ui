import 'package:flutter/material.dart';
import 'package:trackizer_app/config/colors.dart';
import 'package:trackizer_app/screens/home/home_screen.dart';
import 'package:trackizer_app/screens/register/register_screen.dart';
import 'package:trackizer_app/widgets/custom_button.dart';
import 'package:trackizer_app/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            25.0,
            58.0,
            25.0,
            30.0,
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 146,
              ),
              SizedBox(height: size.height * 0.23),
              const CustomTextField(
                title: 'Login',
              ),
              const SizedBox(height: 16.0),
              const CustomTextField(
                title: 'Password',
                isObscure: true,
              ),
              const SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _rememberMe = !_rememberMe;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 24.0,
                          width: 24.0,
                          child: Checkbox(
                            value: _rememberMe,
                            onChanged: (value) {
                              setState(() {
                                _rememberMe = value!;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          'Remember me',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: kGrey50),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Forgot password',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: kGrey50),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              CustomButton(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                    (route) => false,
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
                  'Sign In',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: size.height * 0.18),
              Text(
                'If you don\'t have an account yet?',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20.0),
              CustomButton(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterScreen(),
                  ),
                ),
                mainColor: Colors.white.withOpacity(0.10),
                child: Text(
                  'Sign Up',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
