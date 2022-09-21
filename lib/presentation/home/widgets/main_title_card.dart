import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_project/domain/search_api_call.dart';
import 'package:netflix_project/presentation/infrastructure/api_key.dart';
import 'package:netflix_project/presentation/widgets/loading.dart';
import '../../../core/colors/constants.dart';
import '../../../domain/modelget.dart';
import '../../widgets/maintitle.dart';
import 'maincardhome.dart';

class MainTitleCardsWidget extends StatelessWidget {
  final String title;
  MainTitleCardsWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getDataFromAPI(),
        builder: (context, AsyncSnapshot<List<Result>> data) {
          if (data.data == null) {
            return const Center(
              child: SizedBox(height: 1, width: 1, child: Loading()),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainTextTitlewidget(title: title),
                  kheight,
                  LimitedBox(
                    maxHeight: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                          data.data!.length,
                          (index) => MainCardHomeWidgtet(
                              imgPath: data.data![index].posterPath.toString(),
                              callFrom: title)),
                    ),
                  )
                ],
              ),
            );
          }
        });
  }

  Future<List<Result>> getDataFromAPI() async {
    var url;
    switch (title) {
      case 'Released in the past year':
        url = Uri.parse(
            "https://api.themoviedb.org/3/trending/all/day?api_key=$apikey");
        break;

      default:
        url = Uri.parse(
            "https://api.themoviedb.org/3/trending/all/day?api_key=$apikey");
    }

    final response = await http.get(url);

    final data = getDataApiFromJson(response.body);
    return data.results;
  }
}
