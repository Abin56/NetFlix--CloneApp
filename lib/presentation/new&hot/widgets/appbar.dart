import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/colors/constants.dart';

class NewandHotAppBarWidget extends StatelessWidget {
  const NewandHotAppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'New & Hot',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
      ),
      actions: [
        Icon(
          Icons.cast,
          color: Colors.white,
          size: 33,
        ),
        kwidth,
        Container(
         
          width: 35,

          decoration: BoxDecoration(
              image: DecorationImage(
                
                  image: AssetImage('assest/Images/NetflixImoji.jpg'))),
        ),
      ],
      bottom: TabBar(
        isScrollable: true,
        unselectedLabelColor: kwhite,
        labelColor: kblack,
        indicator: BoxDecoration(borderRadius: kRadius30, color: kwhite),
        tabs: [
          Tab(text: '🍿 Coming Soon'),
          Tab(text: "👀 Everyone's watching")
        ],
      ),
    );
  }
}
