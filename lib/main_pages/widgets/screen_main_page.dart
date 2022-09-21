import 'package:flutter/material.dart';
import 'package:netflix_project/core/colors/colors.dart';
import 'package:netflix_project/main_pages/widgets/bottom_nav.dart';
import 'package:netflix_project/presentation/downloads/screen_download.dart';
import 'package:netflix_project/presentation/fastLaughs/screen_fastlaughs.dart';
import 'package:netflix_project/presentation/home/screen_home.dart';
import 'package:netflix_project/presentation/new&hot/screen_new&hot.dart';
import 'package:netflix_project/presentation/search/screen_search.dart';



class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({Key? key}) : super(key: key);
  final _Page =[
  ScreenHome(),
  ScreenNewandHot(),
  ScreenFastLaughs(),
  ScreenSearch(),
  ScreenDownloads()
  
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body:ValueListenableBuilder(valueListenable: indexChangeNotifier, builder: (BuildContext context, int newindex, Widget? child){
             return _Page[newindex];
      }),
      bottomNavigationBar:BottomNavgationWidget(),

    );
    
  }
}