import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/strings.dart';

final lightThemeData = ThemeData(
    primaryColor: AppColors.cashirBlue,
    fontFamily: Strings.fontFamily,
    colorScheme: ThemeData().colorScheme.copyWith(primary: AppColors.cashirBlue)
);