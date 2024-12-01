import 'package:flutter/material.dart';
import 'package:principle_flutter_project/Screens/login.page.dart';
import 'package:principle_flutter_project/Screens/register.page.dart';
import 'Screens/home.page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
          useMaterial3: true),
      title: 'Barich Hiba  Flutter app ',
      // home: HomePage(),//on supprime homepage parcequon la premiere page doit etre login par exemple et la on utilise routes
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        'home': (context) => HomePage(),
      },
    );
  }
}
