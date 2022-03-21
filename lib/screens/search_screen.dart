import 'package:flutter/material.dart';
import 'package:projectmovie/models/models.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:projectmovie/screens/screens.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);
  @override
  _SearchScreen createState() => _SearchScreen();
}

class _SearchScreen extends State<SearchScreen> {
  // Future<Movie> futureMovie;
  // ignore: deprecated_member_use
  List<Movie> movies = new List();
  final _controller = TextEditingController();
  String keyword;
  @override
  void initState() {
    super.initState();
    keyword = 'Batman';
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    // final String keyword;
    return Scaffold(
      backgroundColor: Colors.black,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Search Movies'),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Container(
              // width: size.width * 0.8,
              child: TextField(
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    setState(() {
                      keyword = value;
                      fetchMovie(keyword);
                      _controller.clear();
                      movies.clear();
                    });
                  }
                },
                controller: _controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search...',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  focusColor: Colors.white.withOpacity(1.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: FutureBuilder(
                future: fetchMovie(keyword),
                // ignore: missing_return
                builder: (context, asyncData) {
                  if (asyncData.hasData && asyncData.data != null) {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 2 / 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return InfoMovie(
                                    poster: movies[index].poster,
                                    title: movies[index].title,
                                    year: movies[index].year,
                                    type: movies[index].type,
                                  );
                                },
                              ),
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(
                                  (movies[index].poster == 'N/A')
                                      ? 'https://www.digopaul.com/wp-content/uploads/related_images/2015/09/09/none_1.jpg'
                                      : movies[index].poster,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (asyncData.hasError) {
                    return Text(
                      'Không tìm thấy phim...',
                      style: TextStyle(color: Colors.white),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<List<Movie>> fetchMovie(String keyword) async {
    var url = 'https://www.omdbapi.com/?s=$keyword&page=1&apikey=564727fa';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var jsonResponseSearch = jsonResponse['Search'];
      var length = jsonResponse['Search'].length;
      for (var i = 0; i < length; i++) {
        movies.add(Movie(
          title: jsonResponseSearch[i]["Title"],
          year: jsonResponseSearch[i]["Year"],
          imdbID: jsonResponseSearch[i]["imdbID"],
          type: jsonResponseSearch[i]["Type"],
          poster: jsonResponseSearch[i]["Poster"],
        ));
      }
    } else {
      throw Exception('Failed to load Movie');
    }
    return Future.value(movies);
  }
}
