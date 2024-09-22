import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spxce/bloc/auth/event.dart';
import 'package:spxce/bloc/auth/state.dart';
import 'package:spxce/services/secure_storage.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  SecureStorage secureStorage;

  AuthenticationBloc(this.secureStorage) : super(AuthenticationInitial()) {
    on<AppStarted>(_appStarted); //on app started event
    on<LoggedIn>(_loggedIn); // on logged in event
    on<LoggedOut>(_loggedOut); // on logged out event
    on<OnboardingCompleted>(_onboardingCompleted); // on onboarding event
  }

  // app started event handler
  _appStarted(AppStarted event, Emitter emit) async {
    // check if first time app is used after installtion
    // and if on boarding is completed
    ///// if (await _checkIfFirstUseAfterInstall() || await _onboardingComplete()) {
    // if true emit onboarding state
    ///// emit(OnboardingState());
    ///// return;
    ///// }

    // checks if user is authenticated
    ///// await _init(emit);

    emit(AuthenticationAuthenticated());
  }

  // handle logged in event
  _loggedIn(LoggedIn event, Emitter emit) async {
    // emit loading state
    emit(AuthenticationLoading());

    // persist email and jwt token in encrypted storage
    await secureStorage.persistEmailAndToken(
        email: event.email, token: event.token);

    // check if user is authenticated successfully
    await _init(emit);
  }

  // handle logged out event
  _loggedOut(LoggedOut event, Emitter emit) async {
    // delete jwt token from encrypted storage
    await secureStorage.deleteToken();

    // check if user is authenticated successfully
    _init(emit);
  }

  // check if first app use after installation
  _checkIfFirstUseAfterInstall() async {
    // get shared preferences instance
    final prefs = await SharedPreferences.getInstance();

    // check if first_run  is in shared preferences
    // and is set to true
    if (prefs.getBool("first_run") ?? true) {
      // if true | clean up encrypted storage
      await secureStorage.deleteAll();

      // set first_run to false in shared preferences
      await prefs.setBool('first_run', false);
    }
  }

  // checks if onboarding is completed
  _onboardingComplete() async {
    // get shared preferences instance
    final prefs = await SharedPreferences.getInstance();

    // check if onboarding_completed is in shared prefs
    if (prefs.getBool('onboarding_completed') ?? true) {
      // if not | return false
      return false;
    }

    // return true if onboarding_completed is on prefs
    return true;
  }

  // handle onboarding completed event
  _onboardingCompleted(OnboardingCompleted event, Emitter emit) async {
    // get shared prefs instance
    final prefs = await SharedPreferences.getInstance();

    // set onboarding_completed in prefs to true
    prefs.setBool('onboarding_completed', true);

    // check if user is authenticated
    await _init(emit);
  }

  // checks if the app is authenticated
  _init(Emitter emit) async {
    // check is jwt token is in encrypted storage
    if (await secureStorage.hasToken()) {
      // if true, emit authenticated state
      emit(AuthenticationAuthenticated());
      return;
    }

    // else emit unauthenticated state
    emit(AuthenticationUnauthenticated());
  }
}
