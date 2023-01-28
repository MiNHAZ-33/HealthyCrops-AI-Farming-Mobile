import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class MyLoading extends StatelessWidget {
  const MyLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child:  SizedBox(
        height: 100,
        child:  LoadingIndicator(
            indicatorType: Indicator.ballRotate,

            /// Required, The loading type of the widget
            colors:  [Colors.red, Colors.orange, Colors.yellow],

            /// Optional, The color collections
            strokeWidth: 2,

            /// Optional, The stroke of the line, only applicable to widget which contains line

            /// Optional, Background of the widget
            pathBackgroundColor: Colors.black

            /// Optional, the stroke backgroundColor
            ),
      ),
    );
  }
}
