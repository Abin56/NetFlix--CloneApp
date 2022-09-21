import 'package:flutter/material.dart';
import 'package:netflix_project/presentation/home/widgets/maincardhome.dart';
import 'package:netflix_project/presentation/new&hot/widgets/appbar.dart';
import 'package:netflix_project/presentation/new&hot/widgets/comingsoon.dart';
import 'package:netflix_project/presentation/new&hot/widgets/everyone_.dart';
import 'package:netflix_project/presentation/widgets/loading.dart';

import '../../domain/modelget.dart';

class ScreenNewandHot extends StatelessWidget {
  const ScreenNewandHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: NewandHotAppBarWidget(),
        ),
        body: TabBarView(children: [
          _buildComingSoon(context),
          _buildEveryonesWatching(),
        ]),
      ),
    );
  }

  Widget _buildComingSoon(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: getDataFromAPI(),
        builder: (context, AsyncSnapshot<List<Result>> datas) {
          if (datas.data == null) {
            return const Center(
              child: SizedBox(height: 50, width: 50, child: Loading()),
            );
          } else {
            return ListView.builder(
              itemBuilder: ((context, index) => ComingSoonWidget(
                    size: size,
                    data: datas.data!,
                    index: index,
                  )),
              itemCount: 10,
              shrinkWrap: true,
            );
          }
        });
  }

  Widget _buildEveryonesWatching() {
    return FutureBuilder(
        future: getDataFromAPI(),
        builder: (context, AsyncSnapshot<List<Result>> datas) {
          if (datas.data == null) {
            return const Center(
              child: SizedBox(height: 40, width: 40, child: Loading()),
            );
          } else {
            return ListView.builder(
              itemBuilder: ((context, index) => EveryOnesWatchingWidget(
                    index: index,
                    data: datas.data!,
                  )),
              itemCount: 10,
            );
          }
        });
  }
}
