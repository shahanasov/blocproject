import 'package:bloc/bloc.dart';
import 'package:blocproject/apiservices/functionsapi.dart';
import 'package:blocproject/apiservices/moviemodel.dart';


part 'movie_event.dart';
part 'movie_state.dart';


class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final Api api;
  List<Movie> trending=[];
  List<Movie> upComing=[];
  List<Movie> topRated=[];


  MovieBloc(this.api) : super(MovieInitial()) {
    on<FetchTrendingMovies>(_onFetchTrendingMovies);
    on<FetchTopRatedMovies>(_onFetchTopRatedMovies);
    on<FetchUpcomingMovies>(_onFetchUpcomingMovies);
    on<SearchMovies>(_onSearchMovies);
  }

  void _onFetchTrendingMovies(FetchTrendingMovies event, Emitter<MovieState> emit) async {
    emit(MovieLoading());
    try {
      trending = await api.gettrendingMovies();
      emit(MovieLoaded(trending));
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }

  void _onFetchTopRatedMovies(FetchTopRatedMovies event, Emitter<MovieState> emit) async {
    emit(MovieLoading());
    try {
      topRated = await api.gettopMovies();
      emit(MovieLoaded(topRated));
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }

  void _onFetchUpcomingMovies(FetchUpcomingMovies event, Emitter<MovieState> emit) async {
    emit(MovieLoading());
    try {
      upComing = await api.getupcoming();
      emit(MovieLoaded(upComing));
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }

  void _onSearchMovies(SearchMovies event, Emitter<MovieState> emit) async {
    emit(MovieLoading());
    try {
      final movies = await api.searchMovies(event.query);
      emit(MovieLoaded(movies));
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }
}

// import 'package:bloc/bloc.dart';
// import 'package:blocproject/apiservices/functionsapi.dart';
// import 'package:blocproject/apiservices/moviemodel.dart';

// part 'movie_event.dart';
// part 'movie_state.dart';

// class MovieBloc extends Bloc<MovieEvent, MovieState> {
//   final Api api;

//   MovieBloc(this.api) : super(MovieInitial()) {
//     on<FetchTrendingMovies>(_onFetchTrendingMovies);
//     on<FetchTopRatedMovies>(_onFetchTopRatedMovies);
//     on<FetchUpcomingMovies>(_onFetchUpcomingMovies);
//     on<SearchMovies>(_onSearchMovies);
//   }

//   void _onFetchTrendingMovies(FetchTrendingMovies event, Emitter<MovieState> emit) {
//     _fetchMovies(emit, api.gettrendingMovies);
//   }

//   void _onFetchTopRatedMovies(FetchTopRatedMovies event, Emitter<MovieState> emit) {
//     _fetchMovies(emit, api.gettopMovies);
//   }

//   void _onFetchUpcomingMovies(FetchUpcomingMovies event, Emitter<MovieState> emit) {
//     _fetchMovies(emit, api.getupcoming);
//   }

//   void _onSearchMovies(SearchMovies event, Emitter<MovieState> emit) {
//     _fetchMovies(emit, () => api.searchMovies(event.query));
//   }

//   Future<void> _fetchMovies(Emitter<MovieState> emit, Future<List<Movie>> Function() fetchFunction) async {
//     emit(MovieLoading());
//     try {
//       final movies = await fetchFunction();
//       emit(MovieLoaded(movies));
//     } catch (e) {
//       emit(MovieError(e.toString()));
//     }
//   }
// }
