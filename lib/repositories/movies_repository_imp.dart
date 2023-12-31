import 'package:movie/utils/apis.utils.dart';
import 'package:movie/models/movies_model.dart';
import 'package:movie/service/dio_service.dart';
import 'package:movie/repositories/movies_repository.dart';

class MoviesRepositoryImp implements MoviesRepository {
  final DioService _dioService;

  MoviesRepositoryImp({required DioService dioService})
      : _dioService = dioService;

  @override
  Future<Movies> getMovies() async {
    var result = await _dioService.getDio().get(API.REQUEST_MOVIE_LIST);

    return Movies.fromJson(result.data);
  }
}
