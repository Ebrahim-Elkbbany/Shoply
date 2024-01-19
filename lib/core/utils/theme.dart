import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoply/core/utils/colors.dart';





ThemeData lightTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: const IconThemeData(size: 24),
      unselectedIconTheme: const IconThemeData(size: 24),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: AppColors.kPrimaryColor,
      elevation: 0,
      unselectedItemColor: AppColors.kSecondaryColor,
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        fontSize: 20,
        color: AppColors.kPrimaryColor,
        fontWeight: FontWeight.w500,
      ),
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.kSecondaryColor, size: 28),
      systemOverlayStyle:  SystemUiOverlayStyle(
        statusBarColor:AppColors.backgroundColor,
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: AppColors.backgroundColor,
      elevation: 0,
      toolbarHeight: 64,
    ),
    iconTheme: const IconThemeData(size: 24),
    scaffoldBackgroundColor: AppColors.backgroundColor,
);

