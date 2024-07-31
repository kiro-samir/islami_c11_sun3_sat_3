import 'package:flutter/material.dart';
import 'package:untitled40/home/quran/sura_detalis_screen.dart';

class ItemSuraName extends StatelessWidget {
  String name;

  int index;

  ItemSuraName({required this.name, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(SuraDetalisScreen.routeName,
            arguments: SuraDetalisArgs(name: name, index: index));
      },
      child: Text(name,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall),
    );
  }
}
