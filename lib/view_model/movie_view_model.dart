import 'package:projectmovie/models/models.dart';

class MovieViewModel {
  final Movie movie;

  MovieViewModel({this.movie});

  String get title {
    return this.movie.title;
  }

  String get poster {
    return this.movie.poster;
  }

  String get year {
    return this.movie.year;
  }

  String get imdbID {
    return this.movie.imdbID;
  }

  String get type {
    return this.movie.type;
  }
}
