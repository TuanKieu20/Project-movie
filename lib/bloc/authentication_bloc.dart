import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:projectmovie/events/authentication_event.dart';
import 'package:projectmovie/repositories/user_repository.dart';
import 'package:projectmovie/states/authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;

  AuthenticationBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(AuthenticationStateInitial());

  @override
  // ignore: missing_return
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent authenticationEvent) async* {
    if (authenticationEvent is AuthenticationEventStarted) {
      final isSignedIn = await _userRepository.isSignedIn();
      if (isSignedIn) {
        final user = await _userRepository.getUser();
        yield AuthenticationStateSuccess(user: user);
      } else {
        yield AuthenticationStateFailuer();
      }
    } else if (authenticationEvent is AuthencationEventLoggedIn) {
      yield AuthenticationStateSuccess(user: await _userRepository.getUser());
    } else if (authenticationEvent is AuthencationEventLoggedOut) {
      _userRepository.signOut();
      yield AuthenticationStateFailuer();
    }
  }
}
