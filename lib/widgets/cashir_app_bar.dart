import 'package:cashir/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

PreferredSizeWidget cashirAppBar({String? title, Widget? leadingWidget,  Color? backgroundColor, double height = kToolbarHeight}) {
  return AppBar(
      toolbarHeight: height,
      backgroundColor: backgroundColor,
      centerTitle: true,
      title: Text(title??"", style: const TextStyle(color: AppColors.cashirBlack, fontSize: 16, fontWeight: FontWeight.w600)),
      leading: leadingWidget,
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      )
  );
}