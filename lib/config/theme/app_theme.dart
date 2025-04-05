import 'package:flora_mart/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: ColorManager.primaryColor,
    scaffoldBackgroundColor: ColorManager.backgroundColor,
    fontFamily: 'Inter',

    // 🎨 ألوان التطبيق
    colorScheme: ColorScheme.light(
      primary: ColorManager.primaryColor, // اللون الأساسي
      secondary: Colors.black87,
      surface: Colors.white, // سطح البطاقات
      onPrimary: Colors.white, // لون النص على اللون الأساسي
      onSecondary: Colors.black, // لون النص على الخلفية
      error: ColorManager.errorColor,
      onError: Colors.white,
      onSurface: Colors.black87, // لون النص على البطاقات
    ),

    // 📝 نصوص التطبيق
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: Colors.black54,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontWeight: FontWeight.w700,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),

    // 🔹 شريط التطبيق العلوي (AppBar)
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black87),
      titleTextStyle: TextStyle(
        color: Colors.black87,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    // 🔘 تصميم الأزرار (Buttons)
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.addToCartButtonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    ),

    // ✏️ تصميم الحقول النصية (TextFields)
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.black12),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.black12),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.pinkAccent),
      ),
    ),

    // 🏠 تصميم شريط التنقل السفلي (Bottom Navigation Bar)
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: ColorManager.primaryColor,
      unselectedItemColor: Colors.black54,
      showUnselectedLabels: true,
    ),

    tabBarTheme: TabBarTheme(
      labelColor: ColorManager.primaryColor,
      dividerColor: Colors.transparent,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: ColorManager.primaryColor,
      unselectedLabelColor: Colors.grey,
      tabAlignment: TabAlignment.start,
    ),

    // 🛒 تصميم بطاقات المنتجات (Cards)
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
  );
}
