import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled40/appcolor.dart';
import 'package:untitled40/home/hadeth/hadeth_tab.dart';
import 'package:untitled40/home/hadeth/item_hadeth_detalis.dart';

import '../../providers/app_config_provider.dart';

class HadethDetalisScreen extends StatefulWidget {
  static const String routeName = "hadeth_detalis";

  @override
  State<HadethDetalisScreen> createState() => _HadethDetalisScreenState();
}

class _HadethDetalisScreenState extends State<HadethDetalisScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;

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
            args.title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: Container(
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
              return ItemHadethDetalis(content: args.content[index]);
            },
            itemCount: args.content.length,
          ),
        ),
      )
    ]);
  }
}
