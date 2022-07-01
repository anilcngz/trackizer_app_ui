import 'package:flutter/material.dart';
import 'package:trackizer_app/config/colors.dart';
import 'package:trackizer_app/screens/login/login_screen.dart';
import 'package:trackizer_app/widgets/custom_button.dart';
import 'package:trackizer_app/widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Color _strengthColor = kGrey70;
  int _strength = 0;

  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp letterReg = RegExp(r".*[A-Za-z].*");

  _checkPasswordStrength(String value) {
    String password = value.trim();

    if (password.isEmpty) {
      setState(() {
        _strengthColor = kGrey70;
        _strength = 0;
      });
    } else if (password.length < 6) {
      setState(() {
        _strengthColor = Colors.red;
        _strength = 1;
      });
    } else if (password.length < 8) {
      setState(() {
        _strengthColor = Colors.orange;
        _strength = 2;
      });
    } else if (!letterReg.hasMatch(password) || !numReg.hasMatch(password)) {
      setState(() {
        _strengthColor = Colors.blue;
        _strength = 3;
      });
    } else {
      setState(() {
        _strengthColor = Colors.green;
        _strength = 4;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
          25.0,
          58.0,
          25.0,
          30.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 146,
              ),
              SizedBox(height: size.height * 0.20),
              CustomTextField(
                title: 'E-mail address',
                controller: _emailController,
              ),
              const SizedBox(height: 16.0),
              CustomTextField(
                title: 'Password',
                controller: _passwordController,
                isObscure: true,
                onChanged: (value) => _checkPasswordStrength(value),
              ),
              const SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: index < 4 ? 3.0 : 0.0),
                      height: 4.0,
                      color: index < _strength ? _strengthColor : kGrey70,
                    ),
                  );
                }),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Use 8 or more characters with a mix of letters, numbers & symbols.',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: kGrey50),
              ),
              const SizedBox(height: 40.0),
              CustomButton(
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
                  'Get Started, it\'s free!',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: size.height * 0.16),
              Text(
                'Do you have already an account?',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20.0),
              CustomButton(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                ),
                mainColor: Colors.white.withOpacity(0.10),
                child: Text(
                  'Sign In',
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
