import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      color: AppColors.primaryColor,
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    )
  );
}
