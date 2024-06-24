import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:blocproject/apiservices/moviemodel.dart';

class Keys{
 static const apikey='bbc436cbd5ee0318f92b779a8b540f39';
 static const imagePath='https://image.tmdb.org/t/p/w500';
}

class Api{
  
  static const _trendingMovies='https://api.themoviedb.org/3/movie/popular?api_key=${Keys.apikey}';

 Future<List<Movie>> gettrendingMovies()async{
  final response = await http.get(Uri.parse(_trendingMovies));
  //200 means if everything is fine 
  if(response.statusCode==200){
    final decoded=json.decode(response.body)['results'] as List;
    // print(decoded);
    return decoded.map((movie) => Movie.fromJson(movie)).toList();
  }else{
    throw Exception('error');
  }
 }

 static const _topRated='https://api.themoviedb.org/3/movie/top_rated?api_key=${Keys.apikey}';
 Future<List<Movie>> gettopMovies()async{
  final response = await http.get(Uri.parse(_topRated));
  if(response.statusCode==200){
    final decoded= json.decode(response.body)['results'] as List;
    return decoded.map((film) => Movie.fromJson(film)).toList();
  }else{
    throw Exception('error');
  }
 }

 static const _upcoming='https://api.themoviedb.org/3/movie/upcoming?api_key=${Keys.apikey}';
 Future<List<Movie>> getupcoming()async{
  final response= await http.get(Uri.parse(_upcoming));
  if(response.statusCode==200){
    final decoded= json.decode(response.body)['results'] as List;
    return decoded.map((film) => Movie.fromJson(film)).toList();
  }else{
    throw Exception('error');
  }
 }


Future<List<Movie>> searchMovies(String query) async {
    final searchUrl = 'https://api.themoviedb.org/3/search/movie?api_key=${Keys.apikey}&query=$query';
    final response = await http.get(Uri.parse(searchUrl));
    if (response.statusCode == 200) {
      final decoded = json.decode(response.body)['results'] as List;
      return decoded.map((film) => Movie.fromJson(film)).toList();
    } else {
      throw Exception('Failed to load search results');
    }
  }


}
