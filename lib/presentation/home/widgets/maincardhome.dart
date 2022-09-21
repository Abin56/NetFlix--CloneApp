import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_project/domain/modelget.dart';
import 'package:netflix_project/presentation/infrastructure/api_key.dart';

import '../../../core/colors/constants.dart';
import 'numbercard.dart';

class MainCardHomeWidgtet extends StatefulWidget {
  String imgPath;
  String callFrom;
  MainCardHomeWidgtet({Key? key, required this.imgPath, required this.callFrom})
      : super(key: key);

  @override
  State<MainCardHomeWidgtet> createState() => _MainCardHomeWidgtetState();
}

class _MainCardHomeWidgtetState extends State<MainCardHomeWidgtet> {
  @override
  void initState() {
    getDataFromAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: kRadius20,
          image:
              DecorationImage(image: NetworkImage(imageBase + widget.imgPath))),
      width: 150,
      height: 250,
    );
  }
}

Future<List<Result>> getDataFromAPI() async {
  final url = Uri.parse(
      "https://api.themoviedb.org/3/trending/all/day?api_key=$apikey");
  final response = await http.get(url);

  final data = getDataApiFromJson(response.body);
  return data.results;
}
