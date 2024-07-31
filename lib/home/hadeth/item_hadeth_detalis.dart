import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../appcolor.dart';
import '../../providers/app_config_provider.dart';

class ItemHadethDetalis extends StatelessWidget {
  String content;

  ItemHadethDetalis({required this.content});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Text(content,
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        style: provider.isDarkMode()
            ? Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: AppColors.yellowColor)
            : Theme.of(context).textTheme.bodySmall);
  }
}
