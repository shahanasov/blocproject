import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:blocproject/apiservices/moviemodel.dart';

class Keys {
  static const apikey = 'bbc436cbd5ee0318f92b779a8b540f39';
  static const imagePath = 'https://image.tmdb.org/t/p/w500';
  static const token = '0e82ad45ffd1369043006416c772e199a52515dc';
  static const sessionId='b31a5ede6b18953611059d1440215cb1ba9885d0';
  static const accountId='21296258';
}

class Api {
  static const _trendingMovies =
      'https://api.themoviedb.org/3/movie/popular?api_key=${Keys.apikey}';

  Future<List<Movie>> gettrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingMovies));

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body)['results'] as List;

      return decoded.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('error');
    }
  }

  static const _topRated =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${Keys.apikey}';
  Future<List<Movie>> gettopMovies() async {
    final response = await http.get(Uri.parse(_topRated));
    if (response.statusCode == 200) {
      final decoded = json.decode(response.body)['results'] as List;
      return decoded.map((film) => Movie.fromJson(film)).toList();
    } else {
      throw Exception('error');
    }
  }

  static const _upcoming =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${Keys.apikey}';
  Future<List<Movie>> getupcoming() async {
    final response = await http.get(Uri.parse(_upcoming));
    if (response.statusCode == 200) {
      final decoded = json.decode(response.body)['results'] as List;
      return decoded.map((film) => Movie.fromJson(film)).toList();
    } else {
      throw Exception('error');
    }
  }

  Future<List<Movie>> searchMovies(String query) async {
    final searchUrl =
        'https://api.themoviedb.org/3/search/movie?api_key=${Keys.apikey}&query=$query';
    final response = await http.get(Uri.parse(searchUrl));
    if (response.statusCode == 200) {
      final decoded = json.decode(response.body)['results'] as List;
      // print(decoded);
      return decoded.map((film) => Movie.fromJson(film)).toList();
    } else {
      throw Exception('Failed to load search results');
    }
  }

  Future<String> createRequestToken() async {
    final response = await http.get(
      Uri.parse(
          'https://api.themoviedb.org/3/authentication/token/new?api_key=${Keys.apikey}'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // print(data['request_token']);
      return data['request_token'];
    } else {
      throw Exception('Failed to create request token');
    }
  }

  Future<String> createSessionId(String requestToken) async {
    try {
      final response = await http.post(
        Uri.parse(
            'https://api.themoviedb.org/3/authentication/session/new?api_key=${Keys.apikey}'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'request_token': requestToken}),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // print(data['session_id']);
        return data['session_id'];
      }
      else
      {
        throw Exception('failed to create session id');
      }
    } on Exception catch (e) {
      print(e);
      rethrow;
    }
  }

Future<void> addToWatchlist(int mediaId, bool watchlist) async {
    const url = 'https://api.themoviedb.org/3/account/${Keys.accountId}/watchlist?api_key=${Keys.apikey}&session_id=${Keys.sessionId}';
    
    final headers = {
      'Content-Type': 'application/json;charset=utf-8'
    };
    
    final body = jsonEncode({
      'media_type': 'movie',
      'media_id': mediaId,
      'watchlist': watchlist,
    });

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 201) {
      print('Movie added to watchlist');
    } else {
      print('Failed to add movie to watchlist: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }

  Future<List<WatchHistory>> getWatchHistory() async {
    const url = 'https://api.themoviedb.org/3/account/${Keys.accountId}/watchlist/movies?api_key=${Keys.apikey}&session_id=${Keys.sessionId}';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> results = jsonDecode(response.body)['results'];
      return results.map((data) => WatchHistory(
        id: data['id'],
        title: data['title'],
        imageUrl: data['poster_path'] != null
            ? 'https://image.tmdb.org/t/p/w500${data['poster_path']}'
            : '',
        description: data['overview'],
        watchedAt: DateTime.now(), // You can replace this with an actual date if available
      )).toList();
    } else {
      throw Exception('Failed to load watch history');
    }
  }



  Future<void> removefromWatchlist(int mediaId, bool watchlist) async {
    const url = 'https://api.themoviedb.org/3/account/${Keys.accountId}/watchlist?api_key=${Keys.apikey}&session_id=${Keys.sessionId}';
    
    final headers = {
      'Content-Type': 'application/json;charset=utf-8'
    };
    
    final body = jsonEncode({
      'media_type': 'movie',
      'media_id': mediaId,
      'watchlist': watchlist,
    });

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 201) {
      print('Movie added to watchlist');
    } else {
      print('Failed to add movie to watchlist: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }
}
  

