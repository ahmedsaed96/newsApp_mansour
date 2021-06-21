import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_apdullah_mansour/bloc/bloc_states.dart';
import 'package:news_app_apdullah_mansour/data/dio/dio_helper.dart';
import 'package:news_app_apdullah_mansour/data/localData/shared_prefrences.dart';

import 'package:news_app_apdullah_mansour/view/screens/businesss_screen.dart';
import 'package:news_app_apdullah_mansour/view/screens/science_screen.dart';
import 'package:news_app_apdullah_mansour/view/screens/search_screen.dart';
import 'package:news_app_apdullah_mansour/view/screens/sport_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppIntialState());

  static AppCubit getApp(BuildContext context) =>
      BlocProvider.of<AppCubit>(context);
  bool isDark = false;

  List<Widget> screens = [
    BusinessHomeScreen(),
    SportsScreen(),
    ScienceScreen(),
    SearchScreen()
  ];
  List<dynamic>? businessData = [];
  List<dynamic>? sportData = [];
  List<dynamic>? scienceData = [];
  int currentIndex = 0;
  void changeIndex(int ind) {
    currentIndex = ind;
    if (currentIndex == 1) {
      getSportData();
    } else if (currentIndex == 2) {
      getScienceData();
    } else if (currentIndex == 3) {
      getSportData();
    }
    emit(AppBottomNavBarState());
  }

  Future? getBusinessData() {
    emit(AppLoadingBusinessState());
    return DioHelper.getData(
      method: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '2251758ef79d4c57ae3c6d0336ab58c7',
      },
    )?.then((value) {
      businessData = value.data['articles'] as List;
      emit(AppBusinessSucsscState());
    }).catchError((e) {
      emit(AppBusinesserrorState(e.toString()));
      debugPrint(e.toString());
    });
  }

  Future? getScienceData() {
    emit(AppLoadingScienceState());
    if (scienceData!.isEmpty) {
      return DioHelper.getData(
        method: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': '2251758ef79d4c57ae3c6d0336ab58c7',
        },
      )?.then((value) {
        scienceData = value.data['articles'] as List;
        emit(AppScienceSucsscState());
      }).catchError((e) {
        emit(AppScienceerrorState(e.toString()));
        debugPrint(e.toString());
      });
    } else {
      emit(AppScienceSucsscState());
    }
  }

  Future? getSportData() {
    emit(AppLoadingSportState());
    if (sportData!.isEmpty) {
      return DioHelper.getData(
        method: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sport',
          'apiKey': '2251758ef79d4c57ae3c6d0336ab58c7',
        },
      )?.then((value) {
        sportData = value.data['articles'] as List;
        emit(AppSportSucsscState());
      }).catchError((e) {
        emit(AppSporterrorState(e.toString()));
        debugPrint(e.toString());
      });
    } else {
      emit(AppSportSucsscState());
    }
  }

  void changeTheme() {
    isDark = !isDark;
    SharedPrefrences.storeThemeMode(isDark: isDark);
    emit(AppChangeThemeState());
  }

  Future getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    isDark = prefs.getBool('Theme')!;
  }

  List<dynamic>? searchData = [];
  TextEditingController controller = TextEditingController();
  Future? getSearchData(String value) {
    searchData = [];
    emit(AppLoadingSearchState());
    if (searchData!.isEmpty) {
      return DioHelper.getData(
        /*https://newsapi.org/v2/everything?q=tesla&sortBy=publishedAt&apiKey=2251758ef79d4c57ae3c6d0336ab58c7*/
        method: 'v2/everything',
        query: {
          // ignore: unnecessary_string_interpolations
          'q': '$value',
          'apiKey': '2251758ef79d4c57ae3c6d0336ab58c7',
        },
      )?.then((value) {
        searchData = value.data['articles'] as List;
        emit(AppSearchSucsscState());
      }).catchError((e) {
        emit(AppSearcherrorState(e.toString()));
        debugPrint(e.toString());
      });
    } else {
      emit(AppSearchSucsscState());
    }
  }
}
