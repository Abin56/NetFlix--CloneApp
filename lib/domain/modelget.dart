// To parse this JSON data, do
//
//     final getDataApi = getDataApiFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetDataApi getDataApiFromJson(String str) => GetDataApi.fromJson(json.decode(str));

String getDataApiToJson(GetDataApi data) => json.encode(data.toJson());

class GetDataApi {
    GetDataApi({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    int page;
    List<Result> results;
    int totalPages;
    int totalResults;

    factory GetDataApi.fromJson(Map<String, dynamic> json) => GetDataApi(
        page: json["page"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}

class Result {
    Result({
        required this.adult,
        required this.backdropPath,
        required this.genreIds,
        required this.id,
        required this.mediaType,
        required this.name,
        required this.originCountry,
        required this.originalLanguage,
        required this.originalName,
        required this.overview,
        required this.popularity,
        required this.posterPath,
        required this.firstAirDate,
        required this.voteAverage,
        required this.voteCount,
        required this.title,
        required this.originalTitle,
        required this.releaseDate,
        required this.video,
    });

    bool? adult;
    String? backdropPath;
    List<int>? genreIds;
    int id;
    MediaType? mediaType;
    String? name;
    List<String>? originCountry;
    OriginalLanguage? originalLanguage;
    String? originalName;
    String? overview;
    double? popularity;
    String? posterPath;
    DateTime? firstAirDate;
    double? voteAverage;
    int? voteCount;
    String? title;
    String? originalTitle;
    DateTime? releaseDate;
    bool? video;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        mediaType: mediaTypeValues.map[json["media_type"]]!,
        name: json["name"] == null ? null : json["name"],
        originCountry: json["origin_country"] == null ? null : List<String>.from(json["origin_country"].map((x) => x)),
        originalLanguage: originalLanguageValues.map[json["original_language"]],
        originalName: json["original_name"] == null ? null : json["original_name"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        firstAirDate: json["first_air_date"] == null ? null : DateTime.parse(json["first_air_date"]),
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
        title: json["title"] == null ? null : json["title"],
        originalTitle: json["original_title"] == null ? null : json["original_title"],
        releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
        video: json["video"] == null ? null : json["video"],
    );

    Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds!.map((x) => x)),
        "id": id,
        "media_type": mediaTypeValues.reverse[mediaType],
        "name": name == null ? null : name,
        "origin_country": originCountry == null ? null : List<dynamic>.from(originCountry!.map((x) => x)),
        "original_language": originalLanguageValues.reverse[originalLanguage],
        "original_name": originalName == null ? null : originalName,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "first_air_date": firstAirDate == null ? null : "${firstAirDate!.year.toString().padLeft(4, '0')}-${firstAirDate!.month.toString().padLeft(2, '0')}-${firstAirDate!.day.toString().padLeft(2, '0')}",
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "title": title == null ? null : title,
        "original_title": originalTitle == null ? null : originalTitle,
        "release_date": releaseDate == null ? null : "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "video": video == null ? null : video,
    };
}

enum MediaType { TV, MOVIE }

final mediaTypeValues = EnumValues({
    "movie": MediaType.MOVIE,
    "tv": MediaType.TV
});

enum OriginalLanguage { EN, JA }

final originalLanguageValues = EnumValues({
    "en": OriginalLanguage.EN,
    "ja": OriginalLanguage.JA
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap ??= map.map((k, v) =>  MapEntry(v, k));
        return reverseMap!;
    }
}
