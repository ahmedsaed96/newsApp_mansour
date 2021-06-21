import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_apdullah_mansour/bloc/bloc_observer.dart';
import 'package:news_app_apdullah_mansour/bloc/bloc_states.dart';
import 'package:news_app_apdullah_mansour/view/screens/home_layout.dart';

import 'bloc/appCubit.dart';
import 'data/dio/dio_helper.dart';

// ignore: avoid_void_async
void main() {
  DioHelper.init();
  Bloc.observer = MyBlocObserver();

  runApp(
    BlocProvider(
        create: (context) => AppCubit()
          ..getThemeMode()
          ..getBusinessData(),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) => MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode:
            AppCubit.getApp(context).isDark ? ThemeMode.dark : ThemeMode.light,
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          textTheme: const TextTheme(
            headline6: TextStyle(color: Colors.black, fontSize: 15.0),
            headline5: TextStyle(color: Colors.black, fontSize: 12.0),
          ),
        ),
        darkTheme: ThemeData(
          primarySwatch: Colors.indigo,
          canvasColor: Colors.grey[850],
          textTheme: const TextTheme(
            headline6: TextStyle(color: Colors.white, fontSize: 15.0),
            headline5: TextStyle(color: Colors.white, fontSize: 12.0),
          ),
        ),
        title: 'News App',
        home: HomeLayout(),
      ),
    );
  }
}
