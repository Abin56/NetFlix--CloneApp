import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_project/core/colors/colors.dart';
import 'package:netflix_project/core/colors/constants.dart';
import 'package:netflix_project/presentation/search/screen_search.dart';
import 'package:netflix_project/presentation/search/widgets/title.dart';
import 'package:netflix_project/presentation/widgets/loading.dart';

import '../../../domain/search_api_call.dart';

const imageurl =
    "https://www.themoviedb.org/t/p/w250_and_h141_face/rlCRM7U5g2hcU1O8ylGcqsMYHIP.jpg";

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTitleText(title: "Top Search"),
        kheight,
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (ctx, index) =>  TopSearchIteamTile(index: index),
            separatorBuilder: (ctx, index) => kheight20,
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class TopSearchIteamTile extends StatelessWidget {
int index;
  TopSearchIteamTile({Key? key,required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    final screenWidth = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future:getDataFromAPITwo() ,
      builder: (BuildContext context , AsyncSnapshot<List<Results>?>data){
        if(data.data==null){
        return const Center(
              child: SizedBox(
                  height: 0, width: 0, child: Loading()),
            );
        }else{
          return  Row(
        children: [
          Container(
            width: screenWidth * 0.34,
            height: 65,
            decoration:  BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(data.data![index].posterImageUrl.toString()),
              ),
            ),
          ),
          kwidth,
           Expanded(
            child: Text(
              data.data![index].originalTitle.toString(),
              style: TextStyle(
                  color: kwhite, fontWeight: FontWeight.bold, fontSize: 16),
            ),
            
            
          ),
          kwidth,
          const CircleAvatar(
            backgroundColor: kwhite,
            radius: 27,
            child: CircleAvatar(
              backgroundColor: kblack,
              radius: 25,
              child: Icon(
                CupertinoIcons.play_fill,
                color: kwhite,
              ),
            ),
          )
        ],
      );

        }
        
      }

      
    );
  }
}
