import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:e_commerce_app/src/common/constants/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.myClothes),
            centerTitle: true,
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.bookmark_rounded),
                ),
                Tab(
                  icon: Icon(Icons.school_rounded),
                )
              ],
            )),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemBuilder: (context, index) => Card(
                  color: Colors.cyan,
                  child: Slidable(
                    key: const ValueKey(0),
                    endActionPane:
                        ActionPane(motion: const BehindMotion(), children: [
                      SlidableAction(
                        backgroundColor: AppConstants.kDefaultErrrColor,
                        icon: Icons.bookmark_remove_rounded,
                        label: AppLocalizations.of(context)!.remove,
                        onPressed: null,
                      ),
                      SlidableAction(
                        backgroundColor: Colors.blue,
                        icon: Icons.download_rounded,
                        label: AppLocalizations.of(context)!.download,
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(4),
                            topRight: Radius.circular(4)),
                        onPressed: (context) {
                          readDialog(context,
                              title: AppLocalizations.of(context)!.download);
                        },
                      ),
                    ]),
                    child: ListTile(
                      onTap: () => readDialog(context,
                          title: AppLocalizations.of(context)!.download),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemBuilder: (context, index) => Card(
                  color: Colors.cyan,
                  child: Slidable(
                    key: const ValueKey(0),
                    endActionPane:
                        ActionPane(motion: const BehindMotion(), children: [
                      SlidableAction(
                        backgroundColor: AppConstants.kDefaultErrrColor,
                        icon: Icons.bookmark_remove_rounded,
                        label: AppLocalizations.of(context)!.remove,
                        onPressed: null,
                      ),
                      SlidableAction(
                        backgroundColor: Colors.blue,
                        icon: Icons.download_rounded,
                        label: AppLocalizations.of(context)!.download,
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(4),
                            topRight: Radius.circular(4)),
                        onPressed: (context) {
                          readDialog(context,
                              title: AppLocalizations.of(context)!.download);
                        },
                      ),
                    ]),
                    child: ListTile(
                      onTap: () => readDialog(context,
                          title: AppLocalizations.of(context)!.download),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String?> readDialog(BuildContext context, {required String title}) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.clothes),
        content: Text("$title\n\n"),
        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(color: Colors.blue, width: 2)),
            ),
            onPressed: () => Navigator.pop(context),
            child: Text(
              AppLocalizations.of(context)!.download,
              style: const TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
