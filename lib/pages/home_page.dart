import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie/models/movies_model.dart';
import 'package:movie/service/dio_service_imp.dart';
import 'package:movie/controllers/movie_controller.dart';
import 'package:movie/repositories/movies_repository_imp.dart';
import 'package:movie/utils/apis.utils.dart';
import 'package:movie/widgets/custom_list_card_widget.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              ValueListenableBuilder<Movies?>(
                  valueListenable: _controller.movies,
                  builder: (__, movies, _) {
                    return Visibility(
                      visible: movies != null,
                      child: Text(
                        "Movies",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    );
                  }),
              ValueListenableBuilder<Movies?>(
                valueListenable: _controller.movies,
                builder: (_, movies, __) {
                  return movies != null
                      ? ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: movies.results.length,
                          itemBuilder: (_, idx) =>
                              CustomListCardWidget(movie: movies.results[idx]),
                          separatorBuilder: (_, __) => const Divider(),
                        )
                      : Center(
                          child: Lottie.asset('assets/lottie.json'),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
