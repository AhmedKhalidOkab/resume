import 'package:flutter/material.dart';
import 'package:resumekhalid/core/conts.dart';
import 'package:resumekhalid/presntaion/screens/auth/login.dart';
import 'package:resumekhalid/presntaion/screens/auth/sginup.dart';
import 'package:resumekhalid/presntaion/screens/home/home.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://ymihyoyeadzesjkynjed.supabase.co',
    anonKey: anonKey,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreem(),
    );
  }
}
