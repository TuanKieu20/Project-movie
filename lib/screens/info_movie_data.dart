import 'package:flutter/material.dart';
import 'package:projectmovie/screens/screens.dart';

class InfoMovieData extends StatelessWidget {
  final String poster;
  final String year;
  final String type;
  final String title;
  final String image;
  final String videoUrl;

  const InfoMovieData(
      {Key key,
      this.poster,
      this.year,
      this.type,
      this.title,
      this.image,
      this.videoUrl})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
                        image: AssetImage(image), fit: BoxFit.fill),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return VideoPlayer(
                                  url: videoUrl,
                                );
                              },
                            ),
                          );
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
              width: size.width * 0.9,
              margin: const EdgeInsets.only(left: 5.0, top: 20.0),
              // height: size.height * 0.3,
              // child: Text(
              //   "Name: $title\nNăm phát hành: $year\nKiểu Phim: $type",
              //   style: TextStyle(
              //       color: Colors.white, fontSize: 20.0, letterSpacing: 2.0),
              // ),
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
                      text: title,
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
                      text: year,
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
                      text: type,
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
