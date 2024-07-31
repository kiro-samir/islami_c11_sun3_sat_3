import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';

class Radio_tab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(
      children: [
        Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Image.asset("asstes/image/radio_logo.png"),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Text("Quran radio"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: provider.isDarkMode()
                  ? Image.asset("asstes/image/dark 5.png")
                  : Image.asset("asstes/image/icon.png"),
            ),
          ],
        )
      ],
    );
  }
}
