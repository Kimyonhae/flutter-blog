import 'package:flutter/material.dart';
import 'package:flutter_blog/view/desktop_view.dart';
import 'package:flutter_blog/view/mobile_view.dart';
import 'package:flutter_blog/view/tablet_view.dart';

class ResponsivlePage extends StatelessWidget {
  const ResponsivlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 700) {
          //휴대폰 기준
          return MobileView();
        } else if (constraints.maxWidth < 1200) {
          return TabletView();
        } else {
          return DeskTopView();
        }
      },
    );
  }
}
