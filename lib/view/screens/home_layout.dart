import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_apdullah_mansour/bloc/appCubit.dart';
import 'package:news_app_apdullah_mansour/bloc/bloc_states.dart';
import 'package:news_app_apdullah_mansour/view/widgets/bottom_nav_bar.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = BlocProvider.of<AppCubit>(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('News App Bar'),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () => cubit.changeTheme(),
                icon: cubit.isDark
                    ? const Icon(Icons.brightness_3_sharp)
                    : const Icon(Icons.brightness_7_sharp),
              )
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: buildBottomNavigationBar(cubit, context),
        );
      },
    );
  }
}
