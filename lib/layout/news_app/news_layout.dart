import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_app/cubit/dark_mode_cubit.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import 'package:news_app/modules/search/search_screen.dart';
import 'package:news_app/shared/components/components.dart';

class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "News App",
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  navigateTo(
                      context: context,
                      widget: SearchScreen()
                  );
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.brightness_2_outlined,
                ),
                onPressed: () {
                  print(
                      "the var before tap is${DarkModeCubit.get(context).isDark}");
                  DarkModeCubit.get(context).changeAppMode();
                  print(
                      "the variable after tap is${DarkModeCubit.get(context).isDark}");
                },
              )
            ],
          ),
          body: NewsAppCubit.get(context)
              .screens[NewsAppCubit.get(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: NewsAppCubit.get(context).bottomNavItems,
            currentIndex: NewsAppCubit.get(context).currentIndex,
            onTap: (index) {
              NewsAppCubit.get(context).changeBotNavItem(index);
            },
          ),
        );
      },
    );
  }
}