import 'dart:async';

import 'package:supabase_flutter/supabase_flutter.dart';

class DBService {
  final supabase = Supabase.instance.client;

//--- SignUp up func
  Future SignUp({required String email, required String password}) async {
    await supabase.auth.signUp(email: email, password: password);
  }

  Future SignIn({required String email, required String password}) async {
    await supabase.auth.signInWithPassword(email: email, password: password);
  }

  Future SignOut() async {
    await supabase.auth.signOut();
  }
}
