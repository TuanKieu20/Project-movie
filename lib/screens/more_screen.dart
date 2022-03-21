import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectmovie/bloc/authentication_bloc.dart';
import 'package:projectmovie/events/authentication_event.dart';
import 'package:projectmovie/repositories/user_repository.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _userRepository = UserRepository();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              // alignment: Alignment.center,
              children: <Widget>[
                Container(
                  height: size.height * 0.28,
                  decoration: BoxDecoration(color: Colors.black),
                ),
                Container(
                  height: size.height * 0.25,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/errorr.jpg"))),
                ),
                Positioned(
                  top: 10,
                  right: 5,
                  child: IconButton(
                    icon: Icon(
                      Icons.exit_to_app,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      BlocProvider.of<AuthenticationBloc>(context).add(
                        AuthencationEventLoggedOut(),
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: size.width * 0.36,
                  child: Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/images/avatar.jpg"),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: FutureBuilder(
                future: _userRepository.getShowUser(),
                builder: (context, snapData) {
                  return RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Your UserID: ',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                            letterSpacing: 1.0,
                          ),
                        ),
                        TextSpan(
                          text: '${snapData.data}',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                            letterSpacing: 1.0,
                          ),
                        ),
                        TextSpan(
                          text: '\nYour Name: ',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                            letterSpacing: 1.0,
                          ),
                        ),
                        TextSpan(
                          text: '\nYour PhoneNumber: ',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                            letterSpacing: 1.0,
                          ),
                        ),
                        TextSpan(
                          text: '\nEmail: ',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Positioned(
              bottom: 20,
              child: ButtonTheme(
                minWidth: size.width,
                buttonColor: Colors.white,
                // ignore: deprecated_member_use
                child: FlatButton(
                  onPressed: () {},
                  child: Text("Log Out"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
