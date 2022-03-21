// import 'package:flutter/cupertino.dart';

class Movie {
  final String title;
  final String year;
  final String imdbID;
  final String type;
  final String poster;

  Movie({this.title, this.year, this.imdbID, this.type, this.poster});
  // factory Movie.fromJson(Map<String, dynamic> json) {
  //   return Movie(
  //     title: json['title'],
  //     year: json['year'],
  //     imdbID: json['imdID'],
  //     type: json['type'],
  //     poster: json['poster'],
  //   );
}
