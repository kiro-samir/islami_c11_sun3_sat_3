import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:untitled40/appcolor.dart';
import 'package:untitled40/home/quran/item_sura_detalis.dart';

import '../../providers/app_config_provider.dart';

class SuraDetalisScreen extends StatefulWidget {
  static const String routeName = "sura_detalis";

  @override
  State<SuraDetalisScreen> createState() => _SuraDetalisScreenState();
}

class _SuraDetalisScreenState extends State<SuraDetalisScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetalisArgs;
    if (verses.isEmpty) {
      loadFile(args.index);
    }

    return Stack(children: [
      provider.isDarkMode()
          ? Image.asset(
              "asstes/image/main_background_dark.png",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            )
          : Image.asset(
              "asstes/image/main_background.png",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
      Scaffold(
        appBar: AppBar(
          title: Text(
            args.name,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: verses.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                color: AppColors.primaryLightColor,
              ))
            : Container(
                margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.06,
                  vertical: MediaQuery.of(context).size.height * 0.05,
                ),
                decoration: BoxDecoration(
                  color: provider.isDarkMode()
                      ? AppColors.primaryDarkColor
                      : AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: provider.isDarkMode()
                          ? AppColors.primaryDarkColor
                          : AppColors.whiteColor,
                      thickness: 2,
                    );
                  },
                  itemBuilder: (context, index) {
                    return ItemSuraDetalis(
                      content: verses[index],
                      index: index,
                    );
                  },
                  itemCount: verses.length,
                ),
              ),
      )
    ]);
  }

  void loadFile(int index) async {
    String contant =
        await rootBundle.loadString("asstes/files/${index + 1}.txt");
    List<String> lines = contant.split("\n");
    for (int i = 0; i < lines.length; i++) {
      print(lines[i]);
    }
    verses = lines;
    setState(() {});
  }
}

class SuraDetalisArgs {
  String name;

  int index;

  SuraDetalisArgs({required this.name, required this.index});
}
