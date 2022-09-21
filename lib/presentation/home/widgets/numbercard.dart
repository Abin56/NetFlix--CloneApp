import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_project/core/colors/colors.dart';
import 'package:netflix_project/presentation/home/widgets/maincardhome.dart';
import 'package:netflix_project/presentation/widgets/loading.dart';
import '../../../core/colors/constants.dart';
import '../../../domain/modelget.dart';


class NumberCardWidget extends StatelessWidget {
  const NumberCardWidget({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getDataFromAPI(),
      builder: (context, AsyncSnapshot<List<Result>>data) {
        if(data.data==null){
        return const Center(
              child: SizedBox(
                  height: 0, width: 0, child: Loading()),
            );
        }else{
      return  Stack(
        children: [
          Row(
            children: [
              const SizedBox(
                height: 10,
                width: 60,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: kRadius20,
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage( imageBase+data.data![index+7].posterPath.toString()))),
                width: 120,
                height: 200,
              ),
            ],
          ),
          Positioned(
              left: 13,
              bottom: 0,
              child: BorderedText(
                strokeWidth: 3.0,
                strokeColor: kwhite,
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(
                      fontSize: 130,
                      fontWeight: FontWeight.bold,
                      color: kblack,
                      decoration: TextDecoration.none),
                ),
              ))
        ],
      );
    
  
  }
      }
    );
  
  }
}
