import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:untitled40/home/hadeth/item_hadeth.dart';

import '../../appcolor.dart';
import '../../providers/app_config_provider.dart';

class Hadeth_tab extends StatefulWidget {
  @override
  State<Hadeth_tab> createState() => _Hadeth_tabState();
}

class _Hadeth_tabState extends State<Hadeth_tab> {
  List<Hadeth> ahadethList = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    if (ahadethList.isEmpty) {
      loadHadeth();
    }

    return Column(
      children: [
        Expanded(child: Image.asset("asstes/image/ahadeth_image.png")),
        Divider(
          color: provider.isDarkMode()
              ? AppColors.yellowColor
              : AppColors.whiteColor,
          thickness: 3,
        ),
        Text(
          AppLocalizations.of(context)!.hadeth,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Divider(
          color: provider.isDarkMode()
              ? AppColors.yellowColor
              : AppColors.whiteColor,
          thickness: 3,
        ),
        Expanded(
          flex: 2,
          child: ahadethList.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                  color: AppColors.primaryLightColor,
                ))
              : ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: provider.isDarkMode()
                          ? AppColors.yellowColor
                          : AppColors.primaryLightColor,
                      thickness: 2,
                    );
                  },
                  itemBuilder: (context, index) {
                    return ItemHadethName(
                      hadeth: ahadethList[index],
                    );
                  },
                  itemCount: ahadethList.length,
                ),
        )
      ],
    );
  }

  void loadHadeth() async {
    String hadethContant =
        await rootBundle.loadString("asstes/files/ahadeth.txt");
    List<String> hadethList = hadethContant.split("#\r\n");
    for (int i = 0; i < hadethList.length; i++) {
      print(hadethList[i]);
      List<String> hadethLines = hadethList[i].split("\n");
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      Hadeth hadeth = Hadeth(title: title, content: hadethLines);
      ahadethList.add(hadeth);
      setState(() {});
    }
  }
}

class Hadeth {
  String title;
  List<String> content;

  Hadeth({required this.title, required this.content});
}
