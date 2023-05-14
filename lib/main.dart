import 'package:flutter/material.dart';
import 'package:ott_platform/provider/ott_provider.dart';
import 'package:ott_platform/view/home_screen.dart';
import 'package:ott_platform/view/splash.dart';
import 'package:ott_platform/view/web_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main()
{
  runApp(
   Sizer(builder: (context, orientation, deviceType) {
     return  ChangeNotifierProvider(
       create: (context) => OTTProvider(),
       child: MaterialApp(
         debugShowCheckedModeBanner: false,
         routes: {
           '/':(context) => SplashScreen(),
           'home':(context) => OTTHomeScreen(),
           'screen':(context) => WebScreen(),
         },
       ),
     );
   },)
  );
}