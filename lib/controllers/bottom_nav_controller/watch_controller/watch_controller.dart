import 'package:get/get.dart';
import 'package:movie_app/modals/movie_modal/movie_modals.dart';
import 'package:movie_app/services/api_services/remote_services.dart';

class WatchController extends GetxController {
  var isLoading = true.obs;
  var movieList = <MovieModal>[].obs;
  List<MovieModal> movieListsearch = <MovieModal>[].obs;
  List<MovieModal> suggestions = <MovieModal>[].obs;
  List<int> staticlist = [1,2,3,4,5,6,7,8];
  @override
  void onInit() {
    fetchmovie();
    super.onInit();
  }

  void fetchmovie() async {
    try {
      isLoading(true);
      var movies = await RemoteServices.fetchmovies();
      movieList.value = movies;
    } finally {
      isLoading(false);
    }
  }
}
