import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:projectmovie/events/login_event.dart';
import 'package:projectmovie/repositories/user_repository.dart';
import 'package:projectmovie/states/login_state.dart';
import 'package:projectmovie/validators/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository _userRepository;
  LoginBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(LoginState.initial());
  @override
  Stream<Transition<LoginEvent, LoginState>> transformEvents(
      Stream<LoginEvent> loginEvents, transitionFn) {
    final debounceStream = loginEvents.where((loginEvent) {
      return (loginEvent is LoginEventEmailChanged ||
          loginEvent is LoginEventPasswordChanged);
    }).debounceTime(Duration(milliseconds: 300));
    final nonDebounceStream = loginEvents.where((loginEvent) {
      return (loginEvent is! LoginEventEmailChanged &&
          loginEvent is! LoginEventPasswordChanged);
    });
    return super.transformEvents(
      nonDebounceStream.mergeWith([debounceStream]),
      transitionFn,
    );
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent loginEvent) async* {
    final loginState = state;
    if (loginEvent is LoginEventEmailChanged) {
      yield loginState.cloneAndUpdate(
        isValidEmail: Validators.isValidEmail(loginEvent.email),
      );
    } else if (loginEvent is LoginEventPasswordChanged) {
      yield loginState.cloneAndUpdate(
        isValidPassword: Validators.isValidPassword(loginEvent.password),
      );
    } else if (loginEvent is LoginEventWithGooglePressed) {
      try {
        await _userRepository.signInWithGoogle();
        yield LoginState.success();
      } catch (_) {
        yield LoginState.failure();
      }
    } else if (loginEvent is LoginEventWidthEmailAndPasswordPressed) {
      try {
        await _userRepository.signInWidthEmailAndPassword(
          loginEvent.email,
          loginEvent.password,
        );
        yield LoginState.success();
      } catch (_) {
        yield LoginState.failure();
      }
    }
  }
}
