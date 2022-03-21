// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:projectmovie/models/models.dart';

// class Webservice {
//   Future<List<Movie>> fetchMovie(String keyword) async {
//     final response = await http.get(Uri.parse(
//         "https://www.omdbapi.com/?s=$keyword&page=1&apikey=564727fa"));
//     if (response.statusCode == 200) {
//       final body = jsonDecode(response.body);
//       final Iterable json = body["Search"];
//       return json.map((movie) => Movie.fromJson(movie)).toList();
//     } else {
//       throw Exception("Failed to load Movie");
//     }
//   }
// }
