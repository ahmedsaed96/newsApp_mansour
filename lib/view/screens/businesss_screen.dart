import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_apdullah_mansour/bloc/appCubit.dart';
import 'package:news_app_apdullah_mansour/bloc/bloc_states.dart';
import 'package:news_app_apdullah_mansour/view/screens/web_view_screen.dart';
import 'package:news_app_apdullah_mansour/view/widgets/custom_divider.dart';
import 'package:news_app_apdullah_mansour/view/widgets/list_tile.dart';

class BusinessHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = BlocProvider.of<AppCubit>(context);
        if (state is AppLoadingBusinessState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: cubit.businessData!.length,
            separatorBuilder: (BuildContext context, int index) =>
                buildCustomDivider(),
            itemBuilder: (BuildContext context, int index) {
              return buildListTileItem(
                  cubit,
                  index,
                  cubit.businessData!,
                  context,
                  () {
                    return Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MyWebView(
                            cubit.businessData![index]['url'].toString()),
                      ));
                  });
            },
          );
        }
      },
    );
  }
}
