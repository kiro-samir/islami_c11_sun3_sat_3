import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled40/appcolor.dart';

import '../../providers/app_config_provider.dart';

class ItemSuraDetalis extends StatelessWidget {
  String content;

  int index;

  ItemSuraDetalis({required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Text(
      "$content()${index + 1}",
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
      style: provider.isDarkMode()
          ? Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: AppColors.yellowColor)
          : Theme.of(context).textTheme.bodySmall,
    );
  }
}
