import 'package:article_finder/bloc/article_list_bloc.dart';
import 'package:article_finder/bloc/bloc_provider.dart';
import 'package:article_finder/ui/app_colors.dart';
import 'package:article_finder/ui/article_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ArticleFinder extends StatelessWidget {
  const ArticleFinder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w700BitterFont = GoogleFonts.bitter(
      fontWeight: FontWeight.w700,
    );
    return BlocProvider(
      bloc: ArticleListBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ArticleListScreen(),
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
      ),
    );
  }
}
