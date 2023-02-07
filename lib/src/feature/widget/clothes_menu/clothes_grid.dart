import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ClothesGridScreen extends StatefulWidget {
  const ClothesGridScreen({super.key});

  @override
  State<ClothesGridScreen> createState() => _ClothesGridScreenState();
}

class _ClothesGridScreenState extends State<ClothesGridScreen> {
  //to constants
  List<Map> classes = [
    {'type': 1, 'name': 'Suits'},
    {'type': 2, 'name': 'Hats'},
    {'type': 3, 'name': 'Skirts'},
    {'type': 4, 'name': 'Dresses'},
    {'type': 5, 'name': 'Coats'},
    {'type': 6, 'name': 'Gym Clothes'},
    {'type': 7, 'name': 'Shirts'},
    {'type': 8, 'name': 'Sweaters'},
    {'type': 9, 'name': 'Shorts'},
    {'type': 10, 'name': 'Jeans'},
    {'type': 11, 'name': 'Hoodies'},
    {'type': 13, 'name': 'Pajamas'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.selectnumber,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24.0, color: Color(0xfff7b55a)),
            ),
            const SizedBox(
              height: 35.0,
            ),
            GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemCount: classes.length,
              itemBuilder: (context, index) => Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: InkWell(
                  onTap: null,
                  child: Center(
                      child: Text(
                    classes[index]['name'],
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
