import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_apdullah_mansour/bloc/appCubit.dart';
import 'package:news_app_apdullah_mansour/bloc/bloc_states.dart';
import 'package:news_app_apdullah_mansour/view/screens/web_view_screen.dart';
import 'package:news_app_apdullah_mansour/view/widgets/custom_divider.dart';
import 'package:news_app_apdullah_mansour/view/widgets/list_tile.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: AppCubit.getApp(context).controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blueGrey[300],
                enabledBorder: InputBorder.none,
              ),
              onChanged: (value) =>
                  AppCubit.getApp(context).getSearchData(value),
              onSubmitted: (value) =>
                  AppCubit.getApp(context).getSearchData(value),
            ),
          ),
          BlocConsumer<AppCubit, AppStates>(
            listener: (context, state) {},
            builder: (context, state) {
              final cubit = BlocProvider.of<AppCubit>(context);
              if (state is AppLoadingSearchState || cubit.searchData!.isEmpty) {
                return Center(
                    child: Text(
                  'No data..',
                  style: Theme.of(context).textTheme.headline4,
                ));
              } else {
                return Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => buildCustomDivider(),
                    physics: const BouncingScrollPhysics(),
                    itemCount: cubit.searchData!.length,
                    itemBuilder: (context, index) => buildListTileItem(
                      cubit,
                      index,
                      cubit.searchData!,
                      context,
                      () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MyWebView(
                            cubit.searchData![index]['url'].toString()),
                      )),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
