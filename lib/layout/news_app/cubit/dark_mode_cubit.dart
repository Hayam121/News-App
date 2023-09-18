import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';



class DarkModeCubit extends Cubit<NewsAppStates> {
  DarkModeCubit(NewsAppStates NewsAppInitialState) : super(NewsAppInitialState);
  static DarkModeCubit get(context)=>BlocProvider.of(context) ;

  bool isDark = false;

  void changeAppMode({
  bool? fromShared ,
}) {
    if(fromShared!= null  ) {
      isDark=fromShared;
      emit(ChangeAppModeState());

    }else{
      isDark=!isDark;
      CasHelper.putBoolean(key: "isDark", value: isDark)
          .then((value){
        emit(ChangeAppModeState());
      }) ;

    }

  }
}