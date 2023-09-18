import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkTheme=ThemeData(
  scaffoldBackgroundColor: HexColor('333739') ,
  primarySwatch: Colors.deepOrange,
  appBarTheme:  AppBarTheme(
      titleSpacing: 20,
      iconTheme: const IconThemeData(
        color: Colors.white ,

      ) ,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness:Brightness.light ,
        statusBarColor: HexColor('333739'),
      ) ,
      backgroundColor: HexColor('333739'),
      elevation: 20,
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,

      )

  ),
  floatingActionButtonTheme:const FloatingActionButtonThemeData(
    backgroundColor: Colors.deepOrange,
  ),

  bottomNavigationBarTheme:  BottomNavigationBarThemeData(
    type:BottomNavigationBarType.fixed ,
    selectedItemColor:Colors.deepOrange ,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    backgroundColor: HexColor('333739') ,

  ),

  textTheme: const TextTheme(
    bodyText1:TextStyle(
      fontSize: 18 ,
      fontWeight:FontWeight.w600  ,
      color: Colors.white ,
    )  ,
  ) ,
);
ThemeData lightTheme=ThemeData(
  primarySwatch: Colors.deepOrange,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
      titleSpacing: 20,
      iconTheme:IconThemeData(
        color: Colors.black ,
      ) ,
      systemOverlayStyle:SystemUiOverlayStyle(
        statusBarIconBrightness:Brightness.dark ,
        statusBarColor: Colors.white,
      ) ,
      backgroundColor: Colors.white,
      elevation: 0 ,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,

      )

  ),
  floatingActionButtonTheme:const FloatingActionButtonThemeData(
    backgroundColor: Colors.deepOrange,
  ),

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(

    type:BottomNavigationBarType.fixed ,
    selectedItemColor:Colors.deepOrange ,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    backgroundColor:Colors.white ,

  ),
  textTheme: const TextTheme(
    bodyText1:TextStyle(
      fontSize: 18 ,
      fontWeight:FontWeight.w600  ,
      color: Colors.black ,
    )  ,
  ) ,
);