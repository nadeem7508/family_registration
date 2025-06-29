import 'package:family_registration/utils/theme/widget_themes/checkbox_theme.dart';
import 'package:family_registration/utils/theme/widget_themes/chip_theme.dart';
import 'package:family_registration/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:family_registration/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:family_registration/utils/theme/widget_themes/text_field_theme.dart';
import 'package:family_registration/utils/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';


import '../constants/colors.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: TColors.grey,
    brightness: Brightness.light,
    primaryColor: TColors.primary,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    scaffoldBackgroundColor: TColors.white,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: TColors.grey,
    brightness: Brightness.dark,
    primaryColor: TColors.primary,
    textTheme: TTextTheme.darkTextTheme,
    chipTheme: TChipTheme.darkChipTheme,
    scaffoldBackgroundColor: TColors.black,
   
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}
