import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:e_commerce_app/src/feature/widget/auth/registration.dart';
import 'package:e_commerce_app/src/feature/widget/auth/sign_in.dart';
import 'package:e_commerce_app/src/feature/widget/app_navigation/navigation_screen.dart';
import 'package:lottie/lottie.dart';

class PreloginScreen extends StatefulWidget {
  static const String routeName = '/auth-greetings';
  const PreloginScreen({super.key});

  @override
  State<PreloginScreen> createState() => _PreloginScreenState();
}

class _PreloginScreenState extends State<PreloginScreen> {
  @override
  void initState() {
    super.initState();
  }

  ElevatedButton customButton(
      {Color? color,
      required VoidCallback? onPressed,
      required String text,
      Color? textColor = Colors.black}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Theme.of(context).focusColor,
          minimumSize: const Size.fromHeight(50),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0))),
      child: Text(
        text,
        style: buttonTextStyle.copyWith(color: textColor),
        textAlign: TextAlign.center,
      ),
    );
  }

  TextStyle buttonTextStyle =
      const TextStyle(fontSize: 16, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 60,
              ),
              Lottie.asset('assets/animations/logo.json', fit: BoxFit.contain),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120),
                child: Wrap(
                  runSpacing: 12,
                  spacing: 10,
                  children: [
                    customButton(
                      text: AppLocalizations.of(context)!.loginUser,
                      color: const Color.fromRGBO(255, 237, 140, 1),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const SignInScreen()));
                      },
                    ),
                    Row(
                      children: <Widget>[
                        const Expanded(
                          child: Divider(
                            height: 8.0,
                          ),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          AppLocalizations.of(context)!.or,
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        const Expanded(
                          child: Divider(
                            height: 8.0,
                          ),
                        )
                      ],
                    ),
                    customButton(
                      color: const Color.fromARGB(255, 255, 219, 33),
                      text: AppLocalizations.of(context)!.registerUser,
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const RegisterScreen()));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
