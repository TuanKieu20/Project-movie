import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projectmovie/bloc/color_block.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:projectmovie/screens/list_favorit_screen.dart';
// import 'package:projectmovie/models/models.dart';
// import 'package:projectmovie/screens/screens.dart';

class InfoMovie extends StatefulWidget {
  final String poster;
  final String year;
  final String type;
  final String title;
  final String image;
  final FirebaseApp app;

  const InfoMovie(
      {Key key,
      this.poster,
      this.year,
      this.type,
      this.title,
      this.image,
      this.app})
      : super(key: key);
  @override
  _InfoMovieState createState() => _InfoMovieState();
}

class _InfoMovieState extends State<InfoMovie> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final referenceDatase = FirebaseDatabase.instance;
    final ref = referenceDatase.reference();
    ColorBloc _colorBloc = new ColorBloc();
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    bool check = false;
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(bottom: 20.0),
                  width: size.width,
                  height: size.height * 0.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.poster), fit: BoxFit.fill),
                  ),
                ),
                Positioned(
                  top: 15.0,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Positioned(
                  bottom: 30.0,
                  right: 0.0,
                  child: Container(
                    width: 50.0,
                    height: 40.0,
                    color: Colors.white,
                    child: StreamBuilder(
                      stream: _colorBloc.colorStream,
                      builder: (context, color) {
                        return IconButton(
                          alignment: Alignment.center,
                          icon: Icon(
                            Icons.favorite,
                            size: 30.0,
                            color: color.data,
                          ),
                          onPressed: () {
                            check = !check;
                            _colorBloc.changeColor();
                            // ignore: deprecated_member_use
                            _scaffoldKey.currentState.showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.white,
                                content: Text(
                                  (check == false)
                                      ? 'You moved this movie to your List favorite movie'
                                      : 'You added this movie to your List favorite movie',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16.0),
                                ),
                                duration: Duration(seconds: 3),
                              ),
                            );
                            ref.child('Movies').push().set({
                              'title': widget.title,
                              'poster': widget.poster,
                              'year': widget.year
                            }).asStream();

                            // ref.once().then((DataSnapshot snapshot) async {
                            //   print('Data: ${snapshot.value}');
                            //   _list.add(ListFavorit(
                            //     title: 'tiltle',
                            //     poster: 'poster',
                            //     year: 'year',
                            //   ));
                            //   // ignore: await_only_futures
                            //   await print(_list);
                            // });
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    width: size.width * 0.4,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    // ignore: deprecated_member_use
                    child: FlatButton(
                        onPressed: () {
                          print('Play');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Play',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Icon(
                              Icons.play_arrow,
                              size: 24.0,
                            ),
                          ],
                        )),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: size.width * 0.4,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    color: Colors.grey,

                    // ignore: deprecated_member_use
                    child: FlatButton(
                      onPressed: () {
                        print('Download');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Download',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Icon(
                            Icons.file_download,
                            color: Colors.white,
                            size: 24.0,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
              // ignore: deprecated_member_use
              child: FlatButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListFavoritScreen()));
                },
                child: Text(
                  "See Your List Favorit",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Container(
              width: size.width * 0.9,
              margin: const EdgeInsets.only(left: 5.0, top: 20.0),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 20.0)
                ],
              ),
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Name: ',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: widget.title,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.grey,
                      ),
                    ),
                    TextSpan(
                      text: '\nYear: ',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: widget.year,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.grey,
                      ),
                    ),
                    TextSpan(
                      text: '\nType: ',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: widget.type,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.grey,
                      ),
                    ),
                    TextSpan(
                      text: '\nMovie quality: ',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'Bản đẹp',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.grey,
                      ),
                    ),
                    TextSpan(
                      text: '\nMovie Pixel: ',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'Full HD',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.grey,
                      ),
                    ),
                    TextSpan(
                      text: '\nDescription:  ',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text:
                          'A lonely young woman, Sintel, helps and befriends a dragon,whom she calls Scales. But when he is kidnapped by an adult dragon, Sintel decides to embark on a dangerous quest to find her lost friend Scales.',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
