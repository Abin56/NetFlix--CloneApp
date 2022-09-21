import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_project/core/colors/constants.dart';
import 'package:netflix_project/presentation/infrastructure/api_key.dart';
import 'package:netflix_project/presentation/search/screen_search.dart';
import 'package:netflix_project/presentation/search/widgets/title.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_project/presentation/widgets/loading.dart';
import '../../../domain/search_api_call.dart';

const imageUrl =
    "https://www.themoviedb.org/t/p/w220_and_h330_face/61PVJ06oecwvcBisoAQu6SDfdcS.jpg";

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getDataFromSearch(searchResult.text),
      builder: (BuildContext context, AsyncSnapshot<List<Results>?> data) {
        if (data.data == null) {
          return const Center(
            child: SizedBox(
                height: 50, width: 50, child: CircularProgressIndicator()),
          );
        } else if (data.data!.isEmpty) {
          return const Text(
            "No match found",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchTitleText(title: "Movies & Tv"),
              kheight,
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1 / 1.4,
                  shrinkWrap: true,
                  children: List.generate(data.data!.length, (index) {
                    return MainCard(
                      index: index,
                    );
                  }),
                ),
              )
            ],
          );
        }
      },
    );
  }
}

class MainCard extends StatelessWidget {
  int index;
  MainCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getDataFromSearch(searchResult.text),
      builder: (BuildContext context, AsyncSnapshot<List<Results>?> data) {
        if (data.data == null) {
          return const Center(
            child: SizedBox(height: 40, width: 40, child: Loading()),
          );
        } else {
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(data.data![index].posterImageUrl),
                ),
                borderRadius: BorderRadius.circular(7)),
          );
        }
      },
    );
  }
}

Future<List<Results>?> getDataFromSearch(String search) async {
  final urls = Uri.parse(
      "https://api.themoviedb.org/3/search/movie?api_key=$apikey&query=$search#");
  final responstosearch = await http.get(urls);
  final datas = getDataApiFromJsonForSearch(responstosearch.body);
  return datas.results;
}
