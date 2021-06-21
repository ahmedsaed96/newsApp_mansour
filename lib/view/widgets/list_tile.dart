import 'package:flutter/material.dart';
import 'package:news_app_apdullah_mansour/bloc/appCubit.dart';

GestureDetector buildListTileItem(AppCubit cubit, int index, List list,
    BuildContext context, Function function) {
  return GestureDetector(
    onTap: () => function(),
    child: SizedBox(
      height: 90.0,
      child: ListTile(
        title: Text(
          list[index]['title'].toString(),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          list[index]['publishedAt'].toString(),
          style: Theme.of(context).textTheme.headline5,
        ),
        leading: list[index]['urlToImage'] != null
            ? Image.network(
                '${list[index]['urlToImage']}',
                fit: BoxFit.cover,
              )
            : Image.network(
                'http://www.aaru.edu.jo/websites/aaru2/wp-content/plugins/learnpress/assets/images/no-image.png?Mobile=1&Source=%2F%5Flayouts%2Fmobile%2Fdispform%2Easpx%3FList%3D78b536db%252De7c7%252D45d9%252Da661%252Ddb2a2aa2fbaf%26View%3D6efc759a%252D0646%252D433c%252Dab6e%252D2f027ffe0799%26RootFolder%3D%252Fwebsites%252Faaru2%252Fwp%252Dcontent%252Fplugins%252Flearnpress%252Fassets%252Fimages%26ID%3D4786%26CurrentPage%3D1',
              ),
      ),
    ),
  );
}
