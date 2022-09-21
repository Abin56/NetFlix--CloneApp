import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_project/core/colors/colors.dart';
import 'package:netflix_project/core/colors/constants.dart';
import 'package:netflix_project/presentation/widgets/app_barwidget.dart';
import 'package:netflix_project/presentation/widgets/loading.dart';

import '../../domain/modelget.dart';
import '../home/widgets/maincardhome.dart';


final List imageList = [
  "https://www.themoviedb.org/t/p/w220_and_h330_face/61PVJ06oecwvcBisoAQu6SDfdcS.jpg",
  "https://www.themoviedb.org/t/p/w220_and_h330_face/stTEycfG9928HYGEISBFaG1ngjM.jpg",
  "https://www.themoviedb.org/t/p/w220_and_h330_face/qJRB789ceLryrLvOKrZqLKr2CGf.jpg"
];

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({Key? key}) : super(key: key);

  final _widgetList = const [Section2(), Section3()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(36),
          child: AppBarWidget(
            title: "Downloads",
          )),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        separatorBuilder: (context, index) => const SizedBox(
          height: 20,
        ),
        itemBuilder: (context, index) => _widgetList[index],
        itemCount: _widgetList.length,
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({Key? key,}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: getDataFromAPI(),
      builder: (context,AsyncSnapshot<List<Result>> snapshort) {
        if(!snapshort.hasData){
    return const Center(
              child: SizedBox(
                  height: 30, width: 30, child: Loading()),
            );
        }else{
        return Column(
          children: [
            kheight,
            Row(
              children: const [
                kwidth,
                Icon(
                  Icons.settings,
                  color: kwhite,
                ),
                kwidth,
                Text("Smart Downloads"),
                kheight
              ],
            ),
            kheight,
            const SizedBox(
              child: Text("Introducing Downloads for you",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kwhite,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            kheight,
            const Text(
              "We'll dowwnloads a personalised selection of\nmovies and shows for you, So there's\nalways something to watch on your\ndevice",
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ),
            kheight,
            SizedBox(
              width: size.width,
              height: size.width,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey.withOpacity(0.5),
                    radius: size.width * 0.43,
                  ),
                  DownloadsImageWidget(
                    imageList: imageBase+snapshort.data![0].posterPath!,
                    margin: const EdgeInsets.only(left: 170, top: 40),
                    angle: 23,
                    size: Size(size.width * 0.45, size.height * 0.3),
                  ),
                  DownloadsImageWidget(
                    imageList: imageBase+snapshort.data![1].posterPath!,
                    margin: const EdgeInsets.only(right: 170, top: 40),
                    angle: -23,
                    size: Size(size.width * 0.45, size.height * 0.3),
                  ),
                  DownloadsImageWidget(
                    radius: 8,
                    imageList: imageBase+snapshort.data![2].posterPath!,
                    margin: const EdgeInsets.only(bottom: 0),
                    size: Size(size.width * 0.47, size.height * 0.33),
                  ),
                ],
              ),
            )
          ],
        );
      }
  });
  }
}

class Section3 extends StatelessWidget {
  const Section3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kbButtonColorBlue,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text(
                "Set up",
                style: TextStyle(
                    color: kwhite, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        kheight,
        Padding(
          padding: const EdgeInsets.all(10),
          child: MaterialButton(
            color: kbButtonColorWhite,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text(
                "See what you can download",
                style: TextStyle(
                    color: kblack, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    Key? key,
    required this.imageList,
    this.angle = 0,
    required this.margin,
    required this.size,
    this.radius = 10,
  }) : super(key: key);

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(imageList),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
