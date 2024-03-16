import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is SignUpEvent) {
      // Fix typo here
      yield* _mapSignInEventToState(event);
    } else if (event is SignUpEvent) {
      yield* _mapSignUpEventToState(event);
    }
    // Add more event handlers as needed
  }

  Stream<AuthState> _mapSignInEventToState(SignUpEvent event) async* {
    // Fix method name here
    try {
      // Handle sign in logic here
      final supabase = await Supabase.instance.client.auth.signInWithPassword(
        email: event.email,
        password: event.password,
      );
      if (supabase.session != null) {
        yield LoginFailure('Login failed!');
      } else {
        yield LoginSuccess('Login successful!');
      }
    } catch (e) {
      yield LoginFailure('An error occurred');
    }
  }

  Stream<AuthState> _mapSignUpEventToState(SignUpEvent event) async* {
    try {
      // Handle sign up logic here
      final supabase = await Supabase.instance.client.auth.signUp(
        email: event.email,
        password: event.password,
      );
      if (supabase.session != null) {
        yield SginUpFailure('Sign up failed!');
      } else {
        yield SginUpSuccess('Sign up successful!');
      }
    } catch (e) {
      yield SginUpFailure('An error occurred');
    }
  }
}

  // Stream<AuthState> mapEventToState(AuthEvent event) async* {
  //   if (event is SignUpEvent) {
  //     // handle SignUpEvent...
  //   } else if (event is LoginEvent) {
  //     try {
  //       final supabase = await Supabase.instance.client.auth.sigi(
  //         email: event.email.trim(),
  //         password: event.password.trim(),
  //       );
  //       if (supabase.session == null) {
  //         yield AuthFailure('Login failed!');
  //       } else {
  //         yield AuthSuccess('Login successful!');
  //       }
  //     } catch (e) {
  //       yield AuthFailure(e.toString());
  //     }
  //   }
  // }
// }
// LoginEvent

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:resumekhalid/bussenslogic/auth/auth_event.dart';
// import 'package:resumekhalid/bussenslogic/auth/auth_state.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class AuthBloc extends Bloc<AuthEvent, AuthState> {
//   AuthBloc() : super(AuthInitial());

  
// }
