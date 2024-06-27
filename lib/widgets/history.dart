import 'package:flutter/material.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailsPage(movie: movie[index])));
                    },
                    child: Container(
                      color: Colors.brown,
                      child: const SizedBox(
                        width: 150,
                        height: 100,
                        // child: Image.network(
                        //     filterQuality: FilterQuality.high,
                        //     fit: BoxFit.cover,
                        //     ''
                        //     // '${Keys.imagePath}${movie[index].posterPath}'),
                        //     ),
                      ),
                    ),
                  ),
                ),
                const Text(
                  'movie[index].title',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
          itemCount: 10
          // movie.length
          ),
    );
  }
}
