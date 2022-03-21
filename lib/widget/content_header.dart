import 'package:flutter/material.dart';
import 'package:projectmovie/data/data.dart';
import 'package:projectmovie/models/models.dart';
import 'package:projectmovie/screens/screens.dart';
import 'package:projectmovie/widget/widget.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContent;

  const ContentHeader({Key key, @required this.featuredContent})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          height: 500.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(featuredContent.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 500.0,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          bottom: 110.0,
          child: SizedBox(
            width: 250.0,
            // child: Image.asset(featuredContent.titleImageUrl),
            child: Text(
              "Transformers",
              style: TextStyle(
                  fontFamily: 'DancingScript',
                  fontSize: 44.0,
                  color: Colors.white,
                  letterSpacing: 1.0),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 40.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              VerticalIconButton(
                icon: Icons.add,
                title: 'List',
                onTap: () => print('My List'),
              ),
              PlayButton(
                icon: Icons.play_arrow,
                label: 'Play',
                onpress: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return VideoPlayer(
                      url: sintelContent.videoUrl,
                    );
                  }));
                },
              ),
              VerticalIconButton(
                icon: Icons.info_outline,
                title: 'Info',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return InfoMovieData(
                      image: featuredContent.imageUrl,
                      title: featuredContent.name,
                      year: 'Null',
                      type: 'Move',
                      videoUrl: featuredContent.videoUrl,
                    );
                  }));
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
