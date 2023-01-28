import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final Widget mobileLayout;
  final Widget webLayout;
  const MainLayout(
      {super.key, required this.mobileLayout, required this.webLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        if (constraint.maxWidth < 600) {
          return mobileLayout;
        } else {
          return webLayout;
        }
      },
    );
  }
}
