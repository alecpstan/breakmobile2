
import 'package:breakmobile2/screens/authenticate/login_page.dart';
import 'package:breakmobile2/screens/home/home.dart';
import 'package:breakmobile2/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://wmetcsjqekdlazgrozyc.supabase.co',
    anonKey:
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndtZXRjc2pxZWtkbGF6Z3JvenljIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTU2MjkxOTIsImV4cCI6MjAxMTIwNTE5Mn0.zw6e5L1y-AzHMewxWQV6Of2eGHPsZHiOZzOqf_XsfL8',
  );

  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MaterialApp(
      title: 'Break!!',
      theme: ThemeData(
        fontFamily: 'Avenir',
        brightness: Brightness.light,
        primarySwatch: Colors.grey,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.grey,
      ),
      themeMode: ThemeMode.light,
      // colorScheme: ColorScheme.dark(
      //   //primary: Colors.white,
      //   //secondary: Colors.white70,
      //
      // ),
      // tabBarTheme: TabBarTheme(
      //   labelStyle: TextStyle(fontSize: 16),
      //
      // ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (_) => const Wrapper(),
        '/login': (_) => const LoginPage(),
        '/home': (_) => const HomePage(),
      },
    );
  }
}
