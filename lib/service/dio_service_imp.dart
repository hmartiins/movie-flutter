import 'package:dio/dio.dart';
import 'package:movie/service/dio_service.dart';

class DioServiceImp implements DioService {
  @override
  Dio getDio() {
    return Dio(
      BaseOptions(baseUrl: 'https://api.themoviedb.org/4/', headers: {
        "content-type": "application/json;charset=utf-8",
        "authorization":
            "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2YzhjMDA5NjQ5YTRiYmIyZDZkY2Q5ZThiNWE0MjUxYSIsInN1YiI6IjY1OTA0YTgwZTY0MGQ2MDJlMmQ1NDk1MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.zf6UYj0lEh2M9XVmYIZwi673nll2KazuAmO5bRFwSWc",
      }),
    );
  }
}
