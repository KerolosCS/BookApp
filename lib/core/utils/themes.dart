/*
 *
 *
 *
 * ----------------
 * | 241030072002 |
 * ----------------
 * Copyright © [2023] KERO CS FLUTTER DEVELOPMENT.
 * All Rights Reserved. For inquiries or permissions, contact  me ,
 * https://www.linkedin.com/in/kerolos-fady-software-engineer/
 *
 * /
 */

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant.dart';

abstract class AppThemes {
  static ThemeData light = ThemeData.light().copyWith(
    textTheme: GoogleFonts.montserratTextTheme(
      ThemeData.light().textTheme,
    ),
    // scaffoldBackgroundColor: kPrimaryColor,
  );
  static ThemeData dark = ThemeData.dark().copyWith(
    textTheme: GoogleFonts.montserratTextTheme(
      ThemeData.dark().textTheme,
    ),
    scaffoldBackgroundColor: kPrimaryColor,
  );
}
