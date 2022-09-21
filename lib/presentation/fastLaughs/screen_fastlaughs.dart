import 'package:flutter/material.dart';
import 'package:netflix_project/presentation/fastLaughs/widgets/video_list_item.dart';
import 'package:netflix_project/presentation/home/widgets/maincardhome.dart';

import '../../domain/modelget.dart';

class ScreenFastLaughs extends StatelessWidget {
  const ScreenFastLaughs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getDataFromAPI(),
        builder: (context, AsyncSnapshot<List<Result>> datas) {
          if (datas.data == null) {
          return const Center(
              child: SizedBox(
                  height: 50, width: 50, child: CircularProgressIndicator()),
            );
          } else {
            return Scaffold(
              body: SafeArea(
                child: PageView(
                  scrollDirection: Axis.vertical,
                  children: List.generate(
                    4,
                    (index) {
                      return VideoListItem(path: datas.data![index].video,
                        index: index,
                      );
                    },
                  ),
                ),
              ),
            );
          }
        });
  }
}
