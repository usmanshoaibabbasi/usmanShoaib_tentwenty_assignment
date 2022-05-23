import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'movie app',
      initialRoute: AppLinks.homescreen,
      getPages: AppRoutes.pages,
    );
  }
}
