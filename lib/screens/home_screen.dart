import 'package:flutter_film/models/movie.dart';
import 'package:flutter_film/services/api_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override 
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService _apiService = ApiService();

  List<Movie>_allMovies = [];
  List<Movie>_trendingMovies = [];
  List<Movie>_popularMovies = [];

  Future<void> _loadMovies() async {
    final List<Map<String, dynamic>> _allMoviesData = await _apiService.getAllMovies();
    final List<Map<String, dynamic>> _trendingMoviesData = await _apiService.getTrendingMovies();
    final List<Map<String, dynamic>> _popularMoviesData = await _apiService.getPopularMovies();
    
    setState(() {
      _allMovies = _allMoviesData.map((e) => Movie.fromJson(e)).toList();
      _trendingMovies = _trendingMoviesData.map((e) => Movie.fromJson(e)).toList();
      _popularMovies = _popularMoviesData.map((e) => Movie.fromJson(e)).toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadMovies();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Film'),
      ),
      body: SingleChildScrollView(
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          //TODO;PANGGIL METHOD YANG MENANMPILKAN ALL MOVIES, TRENDING DAN POPULAR MOVIES
        ),
      ),
    );
  }

  Widget _buildMovieList(String title, List<Movie> movies) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        //movie
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final Movie movie = movies[index];
              return GestureDetector(
                onTap: () {},
                child: Padding(padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image.network(
                      'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                      height: 150,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      movie.title.length > 14 
                      ? '${movie.title.substring(0, 10)}...'
                      : movie.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),

                    )
                  ],
                ),),
                
                
              );
            }
          ),
        )
      ],
    );
  }
}