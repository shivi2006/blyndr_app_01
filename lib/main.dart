import 'package:blyndr_app/OnboardingScreen/OnboardingScreen.dart';
import 'package:flutter/material.dart';
import 'OnboardingScreen/OnboardingScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

int initScreen;

void main() async {
  //SharedPreferences prefs = await SharedPreferences.getInstance();
  //initScreen = await prefs.getInt("initScreen");
   //await prefs.setInt("initScreen", 1);
  //print('initScreen ${initScreen}');
  runApp(MyApp());
}


class MyApp extends StatelessWidget{
  @override

  Widget build(BuildContext context){
   return MaterialApp(
     theme: ThemeData(fontFamily:'GoogleSans'),
     debugShowCheckedModeBanner: false,
   // initialRoute: initScreen == 0 || initScreen == null ? "first" : "/",
     // routes: {
       // '/': (context) => HomePage(),
        //"first": (context) => OnboardingScreen(),
        home: OnboardingScreen(),
   );
}
}

