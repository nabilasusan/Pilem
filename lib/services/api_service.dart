import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "aa1167948abf84c42455da2587e7f9ee";

  Future<List<Map<String, dynamic>>> getAllMovies() async {
    final response = 
    await http.get(url.parse("$baseUrl/movie/now_playing?api_key=$apikey"));
    final data = json.decode(response.body);
    return List<Map<String, dynamic>>.from(data['results']);
  }

   Future<List<Map<String, dynamic>>> getTrendingMovies() async {
    final response = 
    await http.get(url.parse("$baseUrl/movie/week?api_key=$apikey"));
    final data = json.decode(response.body);
    return List<Map<String, dynamic>>.from(data['results']);
  }

 Future<List<Map<String, dynamic>>> getPopularMovies() async {
    final response = 
    await http.get(url.parse("$baseUrl/movie/popular?api_key=$apikey"));
    final data = json.decode(response.body);
    return List<Map<String, dynamic>>.from(data['results']);
  }
}
