class Movie {
  int id;
  String title;
  String backdropPath;
  String overView;
  String posterPath;
  String releaseDate;
  double voteAverage;
  bool watchlist =false;

  Movie(
      {required this.id,
      required this.title,
      required this.backdropPath,
      required this.overView,
      required this.posterPath,
      required this.releaseDate,
      required this.voteAverage});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json["id"],
      title: json["title"],
      backdropPath: json["backdrop_path"],
      overView: json["overview"],
      posterPath: json["poster_path"],
      releaseDate: json["release_date"],
      voteAverage: json["vote_average"],
    );
  }

// to send something to jsonapi
  // Map<String, dynamic> toJson()=>{
  //   "title" :title,
  // };
}

class WatchHistory {
  final int id;
  final String title;
  final String imageUrl;
  final String description;
  final DateTime watchedAt;

  WatchHistory({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.watchedAt,
  });
}
