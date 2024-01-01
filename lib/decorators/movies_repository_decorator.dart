import 'package:movie/models/movies_model.dart';
import 'package:movie/repositories/movies_repository.dart';

class MoviesRepositoryDecorator implements MoviesRepository {
  final MoviesRepository _moviesRepository;

  MoviesRepositoryDecorator({required MoviesRepository moviesRepository})
      : _moviesRepository = moviesRepository;

  @override
  Future<Movies> getMovies() async {
    return await _moviesRepository.getMovies();
  }
}
