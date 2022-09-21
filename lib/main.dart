import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_project/core/colors/colors.dart';
import 'package:netflix_project/main_pages/widgets/screen_main_page.dart';
import 'package:netflix_project/presentation/home/screen_home.dart';

void main(){
  runApp(MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:  const Size(423.5294196844927, 925.0980565145541),
      minTextAdapt: true,
        splitScreenMode: true,
      builder: (context, child) =>
       MaterialApp(
        title: "Netflix",
        theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
          scaffoldBackgroundColor: backgroundColor,
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
          
            bodyText1: TextStyle(color: Colors.white),
             bodyText2: TextStyle(color: Colors.white),
          ),
        backgroundColor: backgroundColor
        ),
        home: ScreenMainPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
    
  }
}
