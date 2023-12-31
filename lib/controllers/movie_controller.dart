import 'package:flutter/material.dart';
import 'package:movie/models/movies_model.dart';
import 'package:movie/models/result_model.dart';
import 'package:movie/repositories/movies_repository.dart';

class MovieController {
  final MoviesRepository _moviesRepository;

  MovieController(this._moviesRepository) {
    fetch();
  }

  ValueNotifier<Movies?> movies = ValueNotifier<Movies?>(null);
  Movies? _cachedMovies;

  onChanged(String value) {
    List<Movie> list = _cachedMovies!.results
        .where(
          (el) => el.toString().toLowerCase().contains(value.toLowerCase()),
        )
        .toList();

    movies.value = movies.value!.copyWith(results: list);
  }

  fetch() async {
    movies.value = await _moviesRepository.getMovies();
    _cachedMovies = movies.value;
  }
}
