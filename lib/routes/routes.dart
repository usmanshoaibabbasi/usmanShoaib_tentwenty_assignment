import 'package:get/get.dart';
import 'package:movie_app/views/home_screens/home_screen.dart';
import 'package:movie_app/views/movie_detail_screen/movie_detail.dart';
import 'package:movie_app/views/search/movie_search_screen.dart';

class AppLinks {
  static const homescreen = '/home_screens';
  static const moviedetailscreen = '/moviedetail_screen';
  static const moviesearchscreen = '/moviesearch_screen';
}

/// Routes

class AppRoutes {
  static final pages = [
    GetPage(
      name: AppLinks.homescreen,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: AppLinks.moviedetailscreen,
      page: () => MovieDetailScreen(),
    ),
    GetPage(
      name: AppLinks.moviesearchscreen,
      page: () => MovieSearchScreen(),
    ),
  ];
}
