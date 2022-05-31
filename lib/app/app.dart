import 'package:article_finder/ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ArticleFinder extends StatelessWidget {
  const ArticleFinder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w700BitterFont = GoogleFonts.bitter(
      fontWeight: FontWeight.w700,
    );
    return MaterialApp(
      title: 'RW Finder',
      home: Text(
        'RW Finder',
      ),
      theme: ThemeData(
        primarySwatch: AppColors.black,
        primaryColor: AppColors.black,
        colorScheme: Theme.of(context).colorScheme.copyWith(
              secondary: AppColors.green,
              primary: AppColors.black,
            ),
        scaffoldBackgroundColor: AppColors.grey,
        backgroundColor: AppColors.grey,
        primaryTextTheme: TextTheme(
          headline6: w700BitterFont,
        ),
        textTheme: TextTheme(
          subtitle1: w700BitterFont.apply(color: AppColors.black),
          headline6: w700BitterFont.apply(color: AppColors.black),
          bodyText2: TextStyle(color: AppColors.black),
        ),
      ),
    );
  }
}
