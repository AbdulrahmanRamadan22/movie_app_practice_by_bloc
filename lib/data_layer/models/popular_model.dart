class PopularModel {
  final int id;
  final bool adult;
  final String posterPath;
  final String backGroundPath;


  
  final double popularityCount;
  final double voteAverage;
  final int voteCount;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final String title;

  final String releaseDate;
  
  final List<dynamic> genreIds;

  PopularModel(
      {required this.id,
      required this.adult,
      required this.posterPath,
      required this.popularityCount,
      required this.voteAverage,
      required this.voteCount,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.title,
      required this.genreIds,

      required this.backGroundPath, 
      required this.releaseDate, 



      });

  factory PopularModel.fromJson(Map<String, dynamic> jsonData) {
    return PopularModel(
        id: jsonData['id'],
        adult: jsonData['adult'],
        posterPath: jsonData['poster_path'],
        popularityCount: jsonData['popularity'],
        voteAverage: jsonData['vote_average'],
        voteCount: jsonData['vote_count'],
        originalLanguage: jsonData['original_language'],
        originalTitle: jsonData['original_title'],
        overview: jsonData['overview'],
        title: jsonData['title'],
        genreIds: jsonData['genre_ids'],
        backGroundPath: jsonData['backdrop_path'],
        releaseDate: jsonData['release_date'],


        );
  }
}
