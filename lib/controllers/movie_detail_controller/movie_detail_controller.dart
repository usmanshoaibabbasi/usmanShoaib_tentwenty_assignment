import 'package:get/get.dart';
import 'package:movie_app/modals/movie_detail_modal/movie_detail_modal.dart';
import 'package:movie_app/services/api_services/remote_services.dart';
import 'package:intl/intl.dart';


class MovieDetailController extends GetxController {
  var isLoading = true.obs;
  int movieId;
  var release_date;
  MovieDetailController(this.movieId,this.release_date);

  var moviedetaillist = <MovieDetailModal>[].obs;
  List<int> staticlist = [1,2,3,4,5,6,7,8];


  @override
  void onInit() {
    moviedetails();
    dateconvert();
    super.onInit();
  }

  void moviedetails() async {
    try {
      isLoading(true);
      var movies = await RemoteServices.fetchmoviesDetail(movieId: movieId);
      moviedetaillist.value = movies;
      // moviedetaillistgen =
    } finally {
      isLoading(false);
    }
  }

  void dateconvert() {
    print('release_date release_date release_date');
    print(release_date);
    var a = DateTime.parse(release_date);
    release_date= DateFormat.yMMMMd().format(a);
  }
}
