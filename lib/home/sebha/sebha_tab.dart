import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';

class Sebha_tab extends StatefulWidget {
  @override
  State<Sebha_tab> createState() => _Sebha_tabState();
}

class _Sebha_tabState extends State<Sebha_tab> {
  int counter = 0;
  double rotat = 0;

  List<String> azkar = ["sbhan allah", "alhmed llah", " allah w akber"];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            provider.isDarkMode()
                ? Image.asset("asstes/image/dark_head_of_seb7a.png")
                : Image.asset("asstes/image/head_of_seb7a.png"),
            Padding(
              padding: const EdgeInsets.only(top: 75),
              child: Transform.rotate(
                angle: rotat,
                child: GestureDetector(
                    onTap: () {
                      onTap();
                    },
                    child: provider.isDarkMode()
                        ? Image.asset("asstes/image/dark_body_of_seb7a.png")
                        : Image.asset("asstes/image/body_of_seb7a.png")),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 27),
          child: Text("count tasbeh", textAlign: TextAlign.center),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 26),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text("$counter"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 26),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text("${azkar[index]}"),
            ),
          ),
        ),
      ],
    );
  }

  onTap() {
    counter++;
    if (counter % 34 == 0) {
      index++;
      counter++;
      counter = 0;
    }
    if (index == azkar.length) {
      index = 0;
    }
    rotat += 360 / 4;
    setState(() {});
  }
}
