List<MovieModal> movielist = [];

class MovieModal {
  int id;
  String title;
  var backdrop_path;
  String release_date;
  String overview;

  MovieModal(
      {required this.id,
      required this.title,
      this.backdrop_path,
      required this.release_date,
      required this.overview});
}
