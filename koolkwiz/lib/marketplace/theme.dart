import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color hexToColor(String hex) {
  return Color(int.parse('0xff$hex'));
}

abstract class Marketplace {
  static ThemeData theme = ThemeData(
    fontFamily: GoogleFonts.lexend().fontFamily,
    textTheme: GoogleFonts.lexendTextTheme()
        .copyWith()
        .apply(bodyColor: Color(0xff000000), displayColor: Color(0xff000000)),
    colorScheme: ColorScheme.light(
        primary: Color(0xffA2E3F6),
        secondary: Color(0xffFFABC7),
        tertiary: Color(0xffDE7A60),
        scrim: Color(0xff4FAD85),
        background: Color(0xffFDF7F0),
        onSecondary: Color(0xff000000),
        shadow: Color(0xffAEAEAE),
        onPrimary: Color(0xffFFFFFF)),
    useMaterial3: true,
    navigationBarTheme: NavigationBarThemeData(
      indicatorColor: Color(0xffA2E3F6),
      indicatorShape: CircleBorder(
        side: BorderSide.lerp(
            BorderSide(
              color: Color(0xff000000),
              width: 2,
            ),
            BorderSide(
              color: Color(0xff000000),
              width: 2,
            ),
            1),
      ),
    ),
  );

  static TextStyle get heading1 => theme.textTheme.headlineLarge!.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 28,
        //height: 36,
        color: theme.colorScheme.onSecondary,
      );

  static TextStyle get heading2 => theme.textTheme.headlineMedium!.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        //height: 32,
        color: theme.colorScheme.onSecondary,
      );

  static TextStyle get heading3 => theme.textTheme.headlineSmall!.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        //height: 24,
        color: theme.colorScheme.onSecondary,
      );

  static TextStyle get subheading1 => theme.textTheme.bodyLarge!.copyWith(
        fontWeight: FontWeight.normal,
        fontSize: 16,
        //height: 20,
        color: theme.colorScheme.onSecondary,
      );

  static TextStyle get subheading2 => theme.textTheme.bodyMedium!.copyWith(
        fontWeight: FontWeight.normal,
        fontSize: 14,
        //height: 18,
        color: theme.colorScheme.onSecondary,
      );
  static TextStyle get paragraph => theme.textTheme.bodySmall!.copyWith(
        fontWeight: FontWeight.normal,
        fontSize: 14,
        //height: 18,
        color: theme.colorScheme.onSecondary,
      );

  static TextStyle get label => theme.textTheme.labelSmall!.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 12,
        //height: 16,
        color: theme.colorScheme.onSecondary,
      );

  static ButtonThemeData get buttonStyle => theme.buttonTheme.copyWith();

  // Spacing
  static int get spacing1 => 32;
  static int get spacing2 => 28;
  static int get spacing3 => 24;
  static int get spacing4 => 20;
  static int get spacing5 => 16;
  static int get spacing6 => 12;
  static int get spacing7 => 8;
  static int get spacing8 => 4;

  static double get lineWidth => 2;

  static Color get cardBackground => Colors.white;
  static Color get appBackground => Color(0xffFDF7F0);

  static double get cornerRadius => 24;
}
