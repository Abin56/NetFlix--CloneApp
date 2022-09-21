import 'package:flutter/material.dart';
import 'package:netflix_project/core/colors/constants.dart';
import 'package:netflix_project/presentation/home/widgets/maincardhome.dart';
import 'package:netflix_project/presentation/widgets/loading.dart';
import '../../../core/colors/colors.dart';
import '../../../domain/modelget.dart';
import '../screen_home.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      future: getDataFromAPI(),
      builder:(context, AsyncSnapshot<List<Result>>data) {
        if(data.data==null){
 return const Center(
              child: SizedBox(
                  height: 0, width: 0, child: Loading()),
            );
        }else{
        return Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 600,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(imageBase+data.data![7].posterPath.toString()))),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                     const   CustomButtonWidget(icon:Icons.add ,title:'My List' ),
                 
                        _playbutton(),
                          CustomButtonWidget(icon: Icons.info, title: 'Info'),
                      ],
                    ),
                  ),
                )
              ],
            );
        }
      } ,
    
      
    );
  
    
  }
  
}
 TextButton _playbutton() {
    return TextButton.icon(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kwhite),),
        onPressed: () {},
        icon: Icon(
          Icons.play_arrow,
          color: kblack,
          size: 30,
        ),
        label: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Text(
            "Play",
            style: TextStyle(fontSize: 20, color: kblack),
          ),
        ));
  }