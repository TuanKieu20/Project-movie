import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:projectmovie/events/register_event.dart';
import 'package:projectmovie/repositories/user_repository.dart';
import 'package:projectmovie/states/register_state.dart';
import 'package:projectmovie/validators/validators.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  UserRepository _userRepository;
  RegisterBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(RegisterState.initial());
  @override
  Stream<Transition<RegisterEvent, RegisterState>> transformEvents(
      Stream<RegisterEvent> loginEvents, transitionFn) {
    final debounceStream = loginEvents.where((loginEvent) {
      return (loginEvent is RegisterEventEmailChanged ||
          loginEvent is RegisterEventPasswordChanged);
    }).debounceTime(Duration(milliseconds: 300));
    final nonDebounceStream = loginEvents.where((loginEvent) {
      return (loginEvent is! RegisterEventEmailChanged &&
          loginEvent is! RegisterEventPasswordChanged);
    });
    return super.transformEvents(
      nonDebounceStream.mergeWith([debounceStream]),
      transitionFn,
    );
  }

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent registerEvent) async* {
    final registerState = state;
    if (registerEvent is RegisterEventEmailChanged) {
      yield registerState.cloneAndUpdate(
        isValidEmail: Validators.isValidEmail(registerEvent.email),
      );
    } else if (registerEvent is RegisterEventPasswordChanged) {
      yield registerState.cloneAndUpdate(
          isValidPassword: Validators.isValidPassword(registerEvent.password));
    } else if (registerEvent is RegisterEventPressed) {
      yield RegisterState.loading();
      try {
        await _userRepository.createUserWidthEmailAndPassword(
          registerEvent.email,
          registerEvent.password,
        );
        yield RegisterState.success();
      } catch (exception) {
        yield RegisterState.failure();
      }
    }
  }
}
