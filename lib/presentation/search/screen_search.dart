import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_project/core/colors/constants.dart';
import 'package:netflix_project/domain/search_api_call.dart';
import 'package:netflix_project/presentation/search/widgets/search_idle.dart';
import 'package:netflix_project/presentation/search/widgets/search_result.dart';
import 'package:http/http.dart' as http;

import '../infrastructure/api_key.dart';

final searchResult = TextEditingController();

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({Key? key}) : super(key: key);

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  @override
  void initState() {
    getDataFromAPITwo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              CupertinoSearchTextField(
                controller: searchResult,
                backgroundColor: Colors.grey.withOpacity(0.4),
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: Colors.grey,
                ),
                style: const TextStyle(color: Colors.white),
                onChanged: (value) async {
                  await getSearch();
                  setState(() {});
                },
              ),
              kheight,
              searchResult.text.isEmpty
                  ? const Expanded(child: SearchIdleWidget())
                  : const Expanded(child: SearchResultWidget())
            ],
          ),
        ),
      ),
    );
  }
}

Future<List<Results>?> getDataFromAPITwo() async {
  final urls = Uri.parse(
      "https://api.themoviedb.org/3/search/movie?api_key=$apikey&query=superman#");
  final responstosearch = await http.get(urls);
  final datas = getDataApiFromJsonForSearch(responstosearch.body);
  return datas.results;
}

Future getSearch() async {
  await Future.delayed(const Duration(seconds: 1));
  return const SearchResultWidget();
}
