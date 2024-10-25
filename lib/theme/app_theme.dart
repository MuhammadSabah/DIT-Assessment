import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kWhiteColor = Color(0xFFFFFFFF);
const Color kPrimaryColor = Color(0xFF9e2a2b);
const Color kGreyColor = Color(0xff4E5663);
const Color kTertiaryGreyColor = Color(0xff6B7280);
const Color kBorderGreyColor = Color(0xffCFD6DD);
const Color kPrimaryBlackColor = Color(0xff131826);
const Color kSecondaryGreyColor = Color(0xFFE8E8E8);
Color kButtonShadowColor = Colors.grey.withOpacity(0.2);

Brightness? currentBrightness =
    SchedulerBinding.instance.platformDispatcher.platformBrightness;

SystemUiOverlayStyle systemStyle = SystemUiOverlayStyle(
  statusBarColor: defaultTargetPlatform == TargetPlatform.iOS
      ? Colors.transparent
      : Colors.transparent,
  statusBarIconBrightness: defaultTargetPlatform == TargetPlatform.iOS
      ? Brightness.dark
      : Brightness.dark,
  statusBarBrightness: Brightness.light,
  systemNavigationBarColor:
      currentBrightness == Brightness.dark ? kPrimaryColor : kWhiteColor,
  systemNavigationBarDividerColor:
      currentBrightness == Brightness.dark ? kPrimaryColor : kWhiteColor,
  systemNavigationBarIconBrightness: defaultTargetPlatform == TargetPlatform.iOS
      ? Brightness.dark
      : Brightness.light,
  systemNavigationBarContrastEnforced: true,
  systemStatusBarContrastEnforced: true,
);

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: kPrimaryColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: kPrimaryColor,
      brightness: Brightness.light,
    ).copyWith(
      primary: kPrimaryColor,
      onPrimary: kWhiteColor,
      secondary: kGreyColor,
      background: kWhiteColor,
    ),
    scaffoldBackgroundColor: kWhiteColor,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    splashFactory: InkSplash.splashFactory,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: Colors.transparent,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      systemOverlayStyle: systemStyle,
      elevation: 0,
      backgroundColor: kWhiteColor,
      scrolledUnderElevation: 0,
      titleTextStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: kWhiteColor,
      ),
    ),
    textTheme: GoogleFonts.poppinsTextTheme(),
  );
}
