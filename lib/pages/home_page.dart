import 'package:flutter/material.dart';
import 'package:movie/models/movies_model.dart';
import 'package:movie/service/dio_service_imp.dart';
import 'package:movie/controllers/movie_controller.dart';
import 'package:movie/repositories/movies_repository_imp.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieController _controller = MovieController(
    MoviesRepositoryImp(
      dioService: DioServiceImp(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<Movies?>(
          valueListenable: _controller.movies,
          builder: (_, movies, __) {
            return movies != null
                ? ListView.builder(
                    itemCount: movies.results.length,
                    itemBuilder: (_, idx) => Text(movies.results[idx].title),
                  )
                : Container();
          }),
    );
  }
}
