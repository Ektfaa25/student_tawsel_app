import 'package:flutter/material.dart';
import 'package:student_tawsel/core/theme/app_pallete.dart';

class AppTheme {
  /// light theme
  static final lightThemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      toolbarHeight: 139,
      color: AppPallete.primaryColor,
      elevation: 0,
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(22),
          bottomRight: Radius.circular(22),
        ),
      ),
      iconTheme: IconThemeData(color: Color(0xff656060)),
      titleTextStyle: TextStyle(
        fontFamily: "Inter",
        fontSize: 32,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
    ),
    textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontFamily: "Inter",
          fontSize: 32,
          color: AppPallete.primaryColor,
          fontWeight: FontWeight.w700,
        ),
        titleMedium: TextStyle(
          fontFamily: "Inter",
          fontSize: 20,
          color: AppPallete.primaryColor,
          fontWeight: FontWeight.w700,
        ),
        bodyLarge:
            TextStyle(fontFamily: "Inter", fontSize: 20, color: Colors.black),
        bodyMedium: TextStyle(
          fontFamily: "Inter",
          fontSize: 16,
          color: AppPallete.LightmodeTextColor,
        ),
        bodySmall: TextStyle(
          fontFamily: "Inter",
          fontSize: 12,
          color: AppPallete.viewAlltextColor,
        ),
        labelMedium: TextStyle(
          fontFamily: "Inter",
          fontWeight: FontWeight.w700,
          fontSize: 14,
          color: Colors.black,
        ),
        labelSmall: TextStyle(
            fontFamily: "Inter",
            fontSize: 11,
            color: AppPallete.secondaryColor)),
  );

  /// dark theme
  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: const Color(0xff0D0D0D),
    appBarTheme: const AppBarTheme(
      toolbarHeight: 139,
      color: AppPallete.primaryColor,
      elevation: 0,
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(22),
          bottomRight: Radius.circular(22),
        ),
      ),
      iconTheme: IconThemeData(color: Color(0xff656060)),
      titleTextStyle: TextStyle(
        fontFamily: "Inter",
        fontSize: 32,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
    ),
    textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontFamily: "Inter",
          fontSize: 32,
          color: AppPallete.DarkmodeTextColor,
          fontWeight: FontWeight.w700,
        ),
        titleMedium: TextStyle(
          fontFamily: "Inter",
          fontSize: 20,
          color: AppPallete.secondaryColor,
          fontWeight: FontWeight.w700,
        ),
        bodyLarge: TextStyle(
            fontFamily: "Inter", fontSize: 20, color: Color(0xffB3B3B3)),
        bodyMedium: TextStyle(
          fontFamily: "Inter",
          fontSize: 16,
          color: AppPallete.DarkmodeTextColor,
        ),
        bodySmall: TextStyle(
            fontFamily: "Inter", fontSize: 12, color: Color(0xffB3B3B3)),
        labelMedium: TextStyle(
          fontFamily: "Inter",
          fontWeight: FontWeight.w700,
          fontSize: 14,
          color: Color(0xffB3B3B3),
        ),
        labelSmall: TextStyle(
            fontFamily: "Inter",
            fontSize: 11,
            color: AppPallete.secondaryColor)),
  );
}
