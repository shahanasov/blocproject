part of 'movie_bloc.dart';

 class MovieState {
   const MovieState();
 }

final class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  final List<Movie> movies;

  const MovieLoaded(this.movies);
}

class MovieError extends MovieState {
  final String message;

  const MovieError(this.message);
}