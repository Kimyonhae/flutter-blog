import 'package:flutter/material.dart';
import 'package:flutter_blog/response/responsivle_page.dart';

void main() {
  runApp(const MyApp());
}

//mvc 패턴.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsivlePage(),
    );
  }
}
