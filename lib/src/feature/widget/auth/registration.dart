import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:e_commerce_app/src/feature/widget/app_navigation/navigation_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/auth-registration';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int _cityId = 1;
  Set<String> cityList = {"Dnipro", "London", "Tokyo"};
  @override
  void dispose() {
    super.dispose();
  }

  String? selectedValue;
  String ptext = '';

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
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 8),
        child: SingleChildScrollView(
            reverse: true,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 60.0,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    AppLocalizations.of(context)!.registerUser,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Form(
                    child: Column(
                      children: [
                        SizedBox(
                          width: 350,
                          child: TextField(
                            onSubmitted: (String txt) {
                              setState(() {
                                ptext = txt;
                              });
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              hintStyle: TextStyle(color: Colors.grey[800]),
                              hintText: AppLocalizations.of(context)!.fullName,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 350,
                          child: TextField(
                            onSubmitted: (String txt) {
                              setState(() {
                                ptext = txt;
                              });
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              hintText: AppLocalizations.of(context)!.login,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 350,
                          child: TextField(
                            onSubmitted: (String txt) {
                              setState(() {
                                ptext = txt;
                              });
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              hintText: AppLocalizations.of(context)!.password,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 350,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 10),
                                DropdownButtonFormField2(
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.zero,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  isExpanded: true,
                                  hint: Text(
                                    AppLocalizations.of(context)!.setCity,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.black45,
                                  ),
                                  iconSize: 35,
                                  buttonHeight: 60,
                                  buttonWidth: 100,
                                  buttonPadding: const EdgeInsets.only(
                                      left: 20, right: 10),
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  items: cityList
                                      .map(
                                        (e) => DropdownMenuItem<String>(
                                          value: e.toString(),
                                          child: Row(
                                            // ignore: prefer_const_literals_to_create_immutables
                                            children: [
                                              const Icon(
                                                  Icons.location_city_rounded),
                                              const SizedBox(
                                                width: 6,
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  validator: (value) {
                                    if (value == null) {
                                      return value;
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {},
                                  onSaved: (value) {
                                    selectedValue = value.toString();
                                    if (value != null) {
                                      _cityId = int.parse(value);
                                    }
                                  },
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: customButton(
                            text: AppLocalizations.of(context)!.loginUser,
                            color: const Color.fromRGBO(255, 237, 140, 1),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HomeScreen()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
