import 'package:blocproject/Business_Logic/watchhistory/watchhistory_bloc.dart';
import 'package:blocproject/apiservices/moviemodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsPage extends StatelessWidget {
  final Movie movie;
  const DetailsPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
  
    bool watchHistory = false;
  
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: BlocBuilder<WatchHistoryBloc, WatchHistoryState>(
        builder: (context, state) {
          if (state is WatchHistoryAdded) {
            
              // context.read()<WatchHistoryBloc>().
            
            watchHistory = !watchHistory;
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                    width: 150,
                    child: Image.network(
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                        'https://image.tmdb.org/t/p/w500/${movie.posterPath}'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 45,
                    width: double.maxFinite,
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero),
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {},
                        icon: const Icon(Icons.play_arrow),
                        label: const Text('Play')),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 45,
                    width: double.maxFinite,
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero),
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.black),
                        onPressed: () {},
                        icon: const Icon(Icons.download),
                        label: const Text('Download')),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(movie.overView),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            context
                                .read<WatchHistoryBloc>()
                                .add(AddToWatchlist(movie.id));
                             
                          },
                          icon: 
                          watchHistory
                              ? const Icon(Icons.turned_in_rounded)
                              : const Icon(Icons.turned_in_not)),
                      const SizedBox(
                        width: 50,
                      ),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.thumb_up)),
                      const SizedBox(
                        width: 50,
                      ),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.share)),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
