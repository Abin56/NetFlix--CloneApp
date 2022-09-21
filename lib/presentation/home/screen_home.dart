import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_project/core/colors/colors.dart';
import 'package:netflix_project/presentation/home/widgets/background.dart';
import 'package:netflix_project/presentation/home/widgets/categories.dart';
import 'package:netflix_project/presentation/home/widgets/main_title_card.dart';
import 'package:netflix_project/presentation/home/widgets/numbercard.dart';
import '../../core/colors/constants.dart';
import '../widgets/maintitle.dart';

const netflixurl = 'https://pngimg.com/uploads/netflix/netflix_PNG15.png';
const imageUrl =
    'https://www.themoviedb.org/t/p/w220_and_h330_face/u3bZgnGQ9T01sWNhyveQz0wH0Hl.jpg';
const mainimageUrl =
    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/pmAv14TPE2vKMIRrVeCd1Ll7K94.jpg';

ValueNotifier<bool> scrollNotifire = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrollNotifire,
      builder: (BuildContext context, index, _) {
        return SafeArea(
          child: NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                scrollNotifire.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifire.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                ListView(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(4),
                      child: BackgroundCard(),
                    ),
                    MainTitleCardsWidget(title: 'Released in the past year'),
                    MainTitleCardsWidget(
                      title: 'Trending Now',
                    ),
                    const NumberTitleCardWidget(),
                    MainTitleCardsWidget(title: 'Tense Dramas'),
                    MainTitleCardsWidget(title: 'South Indian Cinema'),
                  ],
                ),
                scrollNotifire.value == true
                    ? AnimatedContainer(
                        duration: const Duration(microseconds: 1000),
                        width: double.infinity,
                        height: 108,
                        color: Colors.black.withOpacity(0.3),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  netflixurl,
                                  height: 40,
                                  width: 40,
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.cast,
                                  size: 33,
                                  color: Colors.white,
                                ),
                                kwidth,
                                Container(
                                  width: 35,
                                  height: 35,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assest/Images/NetflixImoji.jpg'))),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text('TV Shows', style: kHomeTitleText),
                                const Text('Movies', style: kHomeTitleText),
                                Row(
                                  children: [
                                    LimitedBox(
                                        child: TextButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return const Categories();
                                            });
                                      },
                                      child: const Text(
                                        "Catogary",
                                        style: TextStyle(
                                            color: kwhite,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                                    const Icon(
                                      Icons.arrow_drop_down,
                                      color: kwhite,
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    : kheight
              ],
            ),
          ),
        );
      },
    ));
  }
}

class CustomButtonWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const CustomButtonWidget({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kwhite,
        ),
        Text(title,
            style: const TextStyle(
              fontSize: 18,
            ))
      ],
    );
  }
}

class NumberTitleCardWidget extends StatelessWidget {
  const NumberTitleCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTextTitlewidget(title: 'Top 10 TV Shows in India Today'),
        kheight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
                10,
                (index) => NumberCardWidget(
                      index: index,
                    )),
          ),
        )
      ],
    );
  }
}
