import 'package:flutter/material.dart';
import 'package:news_app_apdullah_mansour/bloc/appCubit.dart';

Theme buildBottomNavigationBar(AppCubit cubit, BuildContext context) {
  return Theme(
    data: Theme.of(context).copyWith(
      canvasColor: Theme.of(context).primaryColor,
    ),
    child: BottomNavigationBar(
      currentIndex: cubit.currentIndex,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      onTap: (value) => cubit.changeIndex(value),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(label: 'Business', icon: Icon(Icons.business)),
        BottomNavigationBarItem(
            label: 'Sport', icon: Icon(Icons.sports_football)),
        BottomNavigationBarItem(label: 'Science', icon: Icon(Icons.science)),
        BottomNavigationBarItem(label: 'Search', icon: Icon(Icons.search)),
      ],
    ),
  );
}
// primaryColor: Colors.red,
// textTheme: Theme.of(context)
//     .textTheme
//     .copyWith(caption: const TextStyle(color: Colors.yellow)),
