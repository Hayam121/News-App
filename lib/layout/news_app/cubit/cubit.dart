import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/setting/settings.dart';
import 'package:news_app/modules/sports/sports_screen.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';


class NewsAppCubit extends Cubit<NewsAppStates> {
  NewsAppCubit() : super(NewsAppInitialState());

  static NewsAppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
    const SettingsScreen(),
  ];

  List<BottomNavigationBarItem> bottomNavItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: "business",
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: "sports",
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: "science",
    ),
  ];

  void changeBotNavItem(int index) {
    currentIndex = index;

    if (index == 1) {      getSports();
    }

    if (index == 2) {
      getScience();
    }

    emit(ChangeBotNavItemState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState(),);
    DioHelper.getData(
      methodUrl: "v2/top-headlines",
      query: {
        "country": "us",
        "category": "business",
        "apiKey": "e94d1e6b12df4e5abece0085d019ff6b",
      },
    ).then((value) {
      business = value.data['articles'];
      print(business[0]["title"]);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print("error is ${error.toString()}");
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(NewsGetSportsLoadingState());
    if (sports.isEmpty) {
      DioHelper.getData(
        methodUrl: "v2/top-headlines",
        query: {
          "country": "us",
          "category": "sports",
          "apiKey": "e94d1e6b12df4e5abece0085d019ff6b",
        },
      ).then((value) {
        sports = value.data['articles'];
        print(sports[0]["title"]);

        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        print("error is ${error.toString()}");
        emit(NewsGetSportsErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsGetScienceLoadingState());
    if (science.isEmpty) {
      DioHelper.getData(
        methodUrl: "v2/top-headlines",
        query: {
          "country": "us",
          "category": "science",
          "apiKey": "e94d1e6b12df4e5abece0085d019ff6b",
        },
      ).then((value) {
        science = value.data['articles'];
        print(science[0]["title"]);

        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print("error is ${error.toString()}");
        emit(NewsGetScienceErrorState(error.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }


  List<dynamic> search = [];

  void getSearch(String value)  {
    emit(NewsGetSearchLoadingState());
      DioHelper .getData(
        methodUrl: "v2/everything",
        query: {
          "q": "$value",
          "apiKey": "e94d1e6b12df4e5abece0085d019ff6b",
        },
      ).then((value) {
        search = value.data['articles'];
        print(search[0]["title"]);

        emit(NewsGetSearchSuccessState());
      }).catchError((error) {
        print("error is ${error.toString()}");
        emit(NewsGetSearchErrorState(error.toString()));
      });

  }

}