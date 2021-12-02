import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:using_provider/pages/home_page.dart';
import 'package:using_provider/providers/homepageprovider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Using Provider',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (context) => HomePageProvider(),
        child: const HomePage()
        ),
      debugShowCheckedModeBanner: false,
    );
  }
}
