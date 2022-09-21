import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_project/core/colors/colors.dart';
import 'package:netflix_project/presentation/fastLaughs/widgets/playvideo.dart';
const  imageUrl = [
  "https://www.themoviedb.org/t/p/w250_and_h141_face/rlCRM7U5g2hcU1O8ylGcqsMYHIP.jpg",
  "https://www.themoviedb.org/t/p/w220_and_h330_face/lJA2RCMfsWoskqlQhXPSLFQGXEJ.jpg",
  "https://www.themoviedb.org/t/p/w220_and_h330_face/nJUHX3XL1jMkk8honUZnUmudFb9.jpg",
  "https://www.themoviedb.org/t/p/w220_and_h330_face/u6Pg9eTklhg6Aa7kXaxrfdE1Chi.jpg",
  "https://www.themoviedb.org/t/p/w220_and_h330_face/sKCr78MXSLixwmZ8DyJLrpMsd15.jpg",
  ]   ;

class VideoListItem extends StatelessWidget {
  var path;
   VideoListItem({Key? key, required this.index,required this.path}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
        child: VideoPlay(index: index, ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //<><><><><><><><><><><><><><><><><Left Side
                CircleAvatar(
                  backgroundColor: kblack.withOpacity(0.5),
                  radius: 30,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.volume_off,size: 30,),
                  ),
                ),
                // ><><><><><>>:<>><><><>><><><><><>Right Side
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  // crossAxisAlignment: CrossAxisAlignment.,
                  children:  [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(imageUrl[index]),
                        radius: 30,
                      ),
                    ),
                    VideoActionsWidget(
                        icon: Icons.emoji_emotions, title: 'LOL'),
                    VideoActionsWidget(icon: Icons.add, title: 'My List'),
                    VideoActionsWidget(icon: Icons.share, title: 'Share'),
                    VideoActionsWidget(icon: Icons.play_arrow, title: 'Play'),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionsWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionsWidget({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: kwhite,
            size: 30,
          ),
          Text(
            title,
            style: TextStyle(color: kwhite, fontSize: 14),
          )
        ],
      ),
    );
  }
}
