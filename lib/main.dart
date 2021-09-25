import 'package:flutter/material.dart';
import 'pages/scroll.page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Doggy',
      debugShowCheckedModeBanner: false,
      initialRoute: 'scroll_scren',
      routes: {'scroll_scren': (_) => const ScrollScreem()},
    );
  }
}