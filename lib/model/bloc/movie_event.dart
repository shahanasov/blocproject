part of 'movie_bloc.dart';

class MovieEvent {
  const MovieEvent();
}

class FetchTrendingMovies extends MovieEvent {}

class FetchTopRatedMovies extends MovieEvent {}

class FetchUpcomingMovies extends MovieEvent {}

class SearchMovies extends MovieEvent {
  final String query;

  const SearchMovies(this.query);
}

// class AuthenticateAndCreateList extends MovieEvent{
//   final String listName;

//   AuthenticateAndCreateList({required this.listName});
  
// }

// class AddToWatchHistory extends MovieEvent{
//   final int mediaId;

//   AddToWatchHistory({required this.mediaId});
  
// }