import 'package:flutter/material.dart';
import 'package:e_commerce_app/src/common/constants/app_theme.dart';
import 'package:flutter/rendering.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:e_commerce_app/src/feature/widget/greetings/prelogin_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static const String routeName = '/prelogin';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final RoundedLoadingButtonController saveChangesButtonController =
      RoundedLoadingButtonController();

  bool isChanged = false;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    //usage of BLoC(with DB)
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            itemBuilder: (context) => [
              PopupMenuItem(
                  value: 0,
                  child: Row(
                    children: [
                      const Icon(Icons.edit_rounded),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(AppLocalizations.of(context)!.changeProfile),
                    ],
                  )),
              PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.logout_rounded,
                        color: AppConstants.kDefaultErrrColor,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        AppLocalizations.of(context)!.logout,
                        style: const TextStyle(
                            color: Color.fromRGBO(242, 100, 25, 1)),
                      ),
                    ],
                  ))
            ],
            onSelected: (value) {
              switch (value) {
                case 0:
                  break;
                case 1:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PreloginScreen()));
                  break;
                default:
              }
            },
          )
        ],
      ),
      backgroundColor: Colors.transparent,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.width / 5 + 4,
                      backgroundColor: AppConstants.kDefaultTextColor,
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.width / 5,
                        backgroundColor: const Color(0xff96C2ED),
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            "SuperMan",
                            style: TextStyle(
                                color: Colors.white, fontSize: size.width / 4),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const ListTile(
                        title: Center(
                          child: Text(
                            "BatMan",
                            style: TextStyle(
                                color: Color(0xff96C2ED),
                                fontWeight: FontWeight.w700,
                                fontSize: 32),
                          ),
                        ),
                        subtitle: Text("Name")),
                  ],
                ),
              ),
              const Divider(
                height: 40,
                endIndent: 30,
                indent: 30,
                thickness: 2,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: Column(
                  children: [
                    CardField(
                      title: AppLocalizations.of(context)!.fullNameShort,
                      value: "Cristiano Ronaldo",
                    ),
                    CardField(
                      title: AppLocalizations.of(context)!.birthdate,
                      value: "05.02.1985",
                    ),
                    CardField(
                      title: AppLocalizations.of(context)!.email,
                      value: "cristi@gmail.com",
                    ),
                    CardField(
                      title: AppLocalizations.of(context)!.phoneNumber,
                      value: "+380975674532",
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

class CardField extends StatelessWidget {
  const CardField({
    Key? key,
    required this.title,
    this.value,
  }) : super(key: key);

  final String title;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: const Color(0xffe4d0cc).withOpacity(.75),
      child: ListTile(
        title: Text(title.toString()),
        subtitle: Text(
          value ?? "not specified",
          style: const TextStyle(color: AppConstants.kDefaultTextColor),
        ),
      ),
    );
  }
}
