import 'package:flutter/material.dart';
import 'package:e_commerce_app/src/common/constants/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController();
  final FocusNode searchBarNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
    //add bloc //add output from DB
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar.medium(
          pinned: false,
          snap: true,
          floating: true,
          elevation: 0,
          centerTitle: true,
          backgroundColor:
              Theme.of(context).appBarTheme.backgroundColor!.withOpacity(1),
          automaticallyImplyLeading: true,
          flexibleSpace: Center(
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              title: TextField(
                focusNode: searchBarNode,
                keyboardAppearance: Brightness.dark,
                autocorrect: false,
                autofocus: false,
                maxLines: 1,
                style: const TextStyle(color: AppConstants.kDefaultAppColor0),
                controller: controller,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(45.0)),
                      borderSide: BorderSide.none),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(45.0)),
                      borderSide: BorderSide.none),
                  errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(45.0)),
                      borderSide: BorderSide.none),
                  hintText: AppLocalizations.of(context)!.searchClothes,
                  prefix: const SizedBox(width: 10),
                  suffixIcon: controller.text.isEmpty
                      ? const Icon(
                          Icons.search,
                          color: AppConstants.kDefaultAppColor0,
                        )
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              controller.clear();
                            });
                          },
                          icon: const Icon(Icons.clear_all_rounded)),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(45.0)),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
