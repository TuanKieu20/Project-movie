// import 'package:flutter/material.dart';
// import 'package:projectmovie/screens/info_movie.dart';
// import 'package:projectmovie/view_model/movie_view_model.dart';
// import 'package:provider/provider.dart';

// class MovieList extends StatelessWidget {
//   final List<MovieViewModel> movies;
//   MovieList({this.movies});
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: this.movies.length,
//       itemBuilder: (context, index) {
//         final movie = this.movies[index];

//         return ListTile(
//           contentPadding: EdgeInsets.all(10),
//           leading: Container(
//             decoration: BoxDecoration(
//                 image: DecorationImage(
//                   fit: BoxFit.cover,
//                   image: NetworkImage(movie.poster),
//                 ),
//                 borderRadius: BorderRadius.circular(6)),
//             width: 50,
//             height: 100,
//           ),
//           title: Text(movie.title),
//         );
//       },
//     );
//   }
// }

// GridView.builder(
//       gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//         maxCrossAxisExtent: 200,
//         childAspectRatio: 2 / 3,
//         crossAxisSpacing: 10,
//         mainAxisSpacing: 10,
//       ),
//       itemCount: movies.length,
//       itemBuilder: (context, index) {
//         return InkWell(
//           onTap: () {
//             Navigator.of(context).push(
//               MaterialPageRoute(
//                 builder: (context) {
//                   return InfoMovie(
//                     poster: movies[index].poster,
//                     title: movies[index].title,
//                     year: movies[index].year,
//                     type: movies[index].imdbID,
//                   );
//                 },
//               ),
//             );
//           },
//           child: Container(
//             alignment: Alignment.center,
//             margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               image: DecorationImage(
//                 image: NetworkImage(
//                   (movies[index].poster == 'N/A')
//                       ? 'https://www.digopaul.com/wp-content/uploads/related_images/2015/09/09/none_1.jpg'
//                       : movies[index].poster,
//                 ),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         );
//       },
//     );
