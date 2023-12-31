import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:movie/models/result_model.dart';
import 'package:movie/utils/apis.utils.dart';

class CustomListCardWidget extends StatelessWidget {
  final Movie movie;
  const CustomListCardWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        color: Colors.black54,
      ),
      child: Row(
        children: [
          Image.network(
            API.REQUEST_IMG(movie.posterPath),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    movie.title,
                    style: Theme.of(context).textTheme.titleLarge,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.right,
                  ),
                  const Spacer(),
                  Text("Popularidade ${movie.popularity}"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
