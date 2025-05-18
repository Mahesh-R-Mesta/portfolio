import 'package:flutter/material.dart';

class ViewPageController extends PageController {
  ViewPageController() : super(initialPage: 0);
  Function(int)? onChange;
  navigateTo(int page) async {
    await animateToPage(page, duration: const Duration(milliseconds: 700), curve: Curves.decelerate);
    onChange?.call(this.page?.toInt() ?? page);
  }
}
