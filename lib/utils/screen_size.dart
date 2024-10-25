import 'package:flutter/cupertino.dart';

class ScreenSize {
  static const double iPhoneSEHeight = 668.0;

  static double getHeight(BuildContext context) {
    return MediaQuery.sizeOf(context).height;
  }

  static double getWidth(BuildContext context) {
    return MediaQuery.sizeOf(context).width;
  }
}
