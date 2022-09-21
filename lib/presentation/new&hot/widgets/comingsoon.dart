import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_project/presentation/new&hot/widgets/buttonwidget.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import '../../../core/colors/colors.dart';
import '../../../core/colors/constants.dart';
import '../../../domain/modelget.dart';

const tempImage =
    'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/rjkmN1dniUHVYAtwuV3Tji7FsDO.jpg';

class ComingSoonWidget extends StatelessWidget {
  int index;
  List<Result> data;

  ComingSoonWidget({
    Key? key,
    required this.data,
    required this.index,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 50,
          height: 480,
          child: StickyHeaderBuilder(
              content: Text(''),
              builder: (context, stuckAmount) {
                stuckAmount = 1 - stuckAmount.clamp(0, 1);
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${date[index]} ',
                      style: const TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                    Text(
                      ' ${day[index]}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                );
              }),
        ),
        SizedBox(
          height: 550.h,
          width: size.width - 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Image.network(
                      imageBase + data[index + 10].posterPath.toString(),
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
                        icon: const Icon(
                          Icons.volume_off,
                          color: kwhite,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    // '${data.data![index+10].title}'.split(' ').first,
                    data[index + 10].title == null
                        ? 'Movies'
                        : '${data[index + 10].title}'.split(' ').first,
                    maxLines: 1,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -4,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  CustomButtonWidgetTwo(
                      icon: Icons.notification_important,
                      title: 'Remind me',
                      iconSize: 20,
                      textSize: 10),
                  kwidth,
                  CustomButtonWidgetTwo(
                      icon: Icons.info,
                      title: 'Info',
                      iconSize: 20,
                      textSize: 10),
                  kwidth,
                ],
              ),
              Text(
                'Coming on ${date[index]}  ${day[index]}',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.grey[200]),
              ),
              kheight,
              Text(
                data[index + 10].title == null
                    ? 'Movies'
                    : '${data[index + 10].title}',
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, color: kwhite),
              ),
              kheight,
              Text(
                '${data[index + 10].overview}',
                maxLines: 4,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

List date = [
  'Mar',
  "Jul",
  'Mar',
  "May",
  'Jan',
  "Oct",
  'Feb',
  "Dec",
  'Dec',
  "Jan"
];
List day = ['11', "24", '31', "14", '09', "06", 'Feb', "10", '01', "26"];
