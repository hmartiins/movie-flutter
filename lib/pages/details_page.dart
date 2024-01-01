import 'package:flutter/material.dart';
import 'package:movie/models/result_model.dart';
import 'package:movie/utils/apis.utils.dart';

class DetailsPage extends StatelessWidget {
  final Movie movie;
  const DetailsPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title,
            style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Hero(
                tag: movie.id,
                child: Image.network(
                  API.REQUEST_IMG(movie.backdropPath != null
                      ? movie.backdropPath!
                      : movie.posterPath),
                  loadingBuilder: (_, child, progress) {
                    if (progress == null) return child;

                    return const CircularProgressIndicator.adaptive();
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 24,
                left: 24,
                right: 24,
                bottom: 8,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        movie.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 14),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          child: Text("4K"),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.calendar_month, color: Colors.white70),
                      const SizedBox(width: 4),
                      Text(
                        "${movie.releaseDate.day}/${movie.releaseDate.month}/${movie.releaseDate.year}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white60,
                        ),
                      ),
                      const SizedBox(width: 30),
                      const Icon(Icons.star, color: Colors.white60),
                      const SizedBox(width: 4),
                      Text(
                        movie.voteAverage.toStringAsFixed(2),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white60,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
