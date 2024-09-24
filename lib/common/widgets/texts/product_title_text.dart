import 'package:flutter/material.dart';

class NProductTitleText extends StatelessWidget {
  const NProductTitleText({super.key, 
  required this.title, 
  this.smallSize=false, 
  this.maxLines=1, 
  this.textAlign=TextAlign.left,
  });

  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
          style:smallSize? Theme.of(context).textTheme.labelLarge: Theme.of(context).textTheme.titleSmall,
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
          textAlign: textAlign,

    );
  }
}