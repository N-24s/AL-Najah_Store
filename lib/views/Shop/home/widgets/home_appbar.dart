import 'package:al_najah_store/common/widgets/appbar/appbar.dart';
import 'package:al_najah_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/text_strings.dart';
import 'package:flutter/material.dart';


class NHomeAppBar extends StatelessWidget {
  const NHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(NTexts.homeAppbarTitle,style: Theme.of(context).textTheme.labelMedium!.apply(color: NColors.grey)),
          Text(NTexts.homrAppbarSubTitle,style: Theme.of(context).textTheme.headlineSmall!.apply(color: NColors.white))
    
        ],
      ),
      actions: [
        NCartCounterIcon(onPressed: () {}, iconColor: NColors.white,),
      ],
    );
  }
}

