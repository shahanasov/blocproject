import 'package:blocproject/apiservices/functionsapi.dart';
import 'package:blocproject/apiservices/moviemodel.dart';
import 'package:flutter/material.dart';

class ScrollItems extends StatelessWidget {
  final List<Movie> movie;
  const ScrollItems({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Tooltip(
                    message: 'just tap',
                    child: InkWell(
                      child: SizedBox(
                        width: 150,
                        height: 200,
                        child: Image.network(
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover,
                            '${Keys.imagePath}${movie[index].posterPath}'),
                      ),
                    ),
                  ),
                ),
                Text(
                  movie[index].title,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
          itemCount: movie.length),
    );
  }
}
