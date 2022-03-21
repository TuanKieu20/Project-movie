// import 'package:flutter/material.dart';
// import 'movie_view_model.dart';
// import 'package:projectmovie/webserice/webservice.dart';

// class MovieListViewModel extends ChangeNotifier {
//   // ignore: deprecated_member_use
//   List<MovieViewModel> movies = List<MovieViewModel>();
//   Future<void> fetchMovies(String keyword) async {
//     final results = await Webservice().fetchMovie(keyword);
//     this.movies = results.map((e) => MovieViewModel(movie: e)).toList();
//     notifyListeners();
//   }
// }
