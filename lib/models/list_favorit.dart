import 'package:firebase_database/firebase_database.dart';

class ListFavorit {
  final String id;
  final String title;
  final String poster;
  final String year;

  ListFavorit({this.id, this.title, this.poster, this.year});

  ListFavorit.fromSnapshot(DataSnapshot snapshot)
      : id = snapshot.key,
        title = snapshot.value["title"],
        poster = snapshot.value["poster"],
        year = snapshot.value["year"];

  toJson() {
    return {
      'title': title,
      'poster': poster,
      'year': year,
    };
  }
}

class DatabaseService {
  static Future<List<ListFavorit>> getListFavorit() async {
    // ignore: await_only_futures
    Query listFavoritsSnapshot = await FirebaseDatabase.instance
        .reference()
        .child("Movies")
        .orderByKey();

    print(listFavoritsSnapshot); // to debug and see if data is returned

    List<ListFavorit> listFavorits;

    Map<dynamic, dynamic> values = listFavoritsSnapshot.path as Map;
    values.forEach((key, values) {
      listFavorits.add(ListFavorit.fromSnapshot(values));
    });
    return listFavorits;
  }
}
