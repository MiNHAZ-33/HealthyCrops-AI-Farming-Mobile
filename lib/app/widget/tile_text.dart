import 'package:flutter/material.dart';

import '../../util/const.dart';

class TileText extends StatelessWidget {
  final String title;
  const TileText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
          color: darkTextColor, fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}
