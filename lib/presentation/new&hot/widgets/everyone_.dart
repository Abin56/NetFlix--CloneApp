import 'package:flutter/material.dart';
import 'package:netflix_project/presentation/home/widgets/maincardhome.dart';
import 'package:netflix_project/presentation/new&hot/widgets/buttonwidget.dart';
import 'package:netflix_project/presentation/new&hot/widgets/comingsoon.dart';

import '../../../core/colors/colors.dart';
import '../../../core/colors/constants.dart';
import '../../../domain/modelget.dart';

class EveryOnesWatchingWidget extends StatelessWidget {
  int index;
  List<Result> data;
  EveryOnesWatchingWidget({
    required this.index,
    required this.data,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${data[index].title}',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: kwhite),
        ),
        kheight,
        Text(
          '${data[index].overview}',
          maxLines: 4,
          style: TextStyle(color: Colors.grey),
        ),
        kheight45,
        Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: 200,
              child: Image.network(
                imageBase + data[index].posterPath.toString(),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 10,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.black.withOpacity(0.5),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.volume_off,
                    color: kwhite,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
        kheight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            CustomButtonWidgetTwo(
                icon: Icons.share, title: 'Share', iconSize: 20, textSize: 12),
            kwidth,
            CustomButtonWidgetTwo(
                icon: Icons.add, title: 'My list', iconSize: 22, textSize: 11),
            kwidth,
            CustomButtonWidgetTwo(
                icon: Icons.play_arrow,
                title: 'Play',
                iconSize: 20,
                textSize: 12),
            kwidth,
          ],
        )
      ],
    );
  }
}
