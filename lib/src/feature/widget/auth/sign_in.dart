import 'package:flutter/material.dart';
import 'package:e_commerce_app/src/common/constants/app_theme.dart';
import 'package:e_commerce_app/src/feature/widget/app_navigation/navigation_screen.dart';
import 'package:e_commerce_app/src/feature/widget/clothes_menu/clothes_grid.dart';
import 'package:e_commerce_app/src/feature/widget/cart/cart_screen.dart';
import 'package:e_commerce_app/src/feature/widget/profile/profile_screen.dart';
import 'package:e_commerce_app/src/feature/widget/search/search_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInScreen extends StatefulWidget {
  static const String routeName = '/auth-sign_in';
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  TextStyle buttonTextStyle =
      const TextStyle(fontSize: 16, color: Colors.black);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Builder(builder: (context) {
        return Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  AppLocalizations.of(context)!.loginUser,
                  style: const TextStyle(
                    fontSize: 72.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                  color: AppConstants.kDefaultAppColor0)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                  color: AppConstants.kDefaultGoldColor)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                  color: AppConstants.kDefaultErrrColor)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                  color: AppConstants.kDefaultSuccColor)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide:
                                  const BorderSide(color: Colors.white38)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                  color: AppConstants.kDefaultErrrColor)),
                          filled: false,
                          hintText: AppLocalizations.of(context)!.login,
                          fillColor: AppConstants.kDefaultAppColor0),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                  color: AppConstants.kDefaultAppColor0)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                  color: AppConstants.kDefaultGoldColor)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                  color: AppConstants.kDefaultErrrColor)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                  color: AppConstants.kDefaultSuccColor)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide:
                                  const BorderSide(color: Colors.white38)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                  color: AppConstants.kDefaultErrrColor)),
                          filled: false,
                          hintText: AppLocalizations.of(context)!.password,
                          fillColor: AppConstants.kDefaultAppColor0),
                    ),
                    const SizedBox(height: 18),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: customButton(
                        text: AppLocalizations.of(context)!.loginUser,
                        color: const Color.fromRGBO(255, 237, 140, 1),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
