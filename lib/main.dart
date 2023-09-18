import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_app/cubit/dark_mode_cubit.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import 'package:news_app/layout/news_app/news_layout.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'package:news_app/shared/style.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized() ;
  DioHelper.init() ;
 await CasHelper.init() ;

 bool? isDark=CasHelper.getBoolean(key:"isDark") ;

  runApp(  MyApp(isDark));
}

class MyApp extends StatelessWidget
{


  final bool? isDark ;
  MyApp(this.isDark) ;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(

      providers:  [
        BlocProvider(
        create:(context)=>NewsAppCubit()..getBusiness()..getScience()..getSports() ),
        BlocProvider(
    create: (BuildContext context) =>DarkModeCubit(NewsAppInitialState())..changeAppMode(
    fromShared: isDark ),
        )
    ],
    child:
        BlocConsumer<DarkModeCubit,NewsAppStates>(

          listener: (BuildContext context, state){},
          builder: (BuildContext context,  state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: DarkModeCubit.get(context).isDark ? ThemeMode.dark:ThemeMode.light,
              home:  const HomeLayoutScreen(),
            );
          },

        ),
      );

  }
}