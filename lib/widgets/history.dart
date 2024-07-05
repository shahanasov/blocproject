import 'package:blocproject/Business_Logic/watchhistory/watchhistory_bloc.dart';
import 'package:blocproject/apiservices/functionsapi.dart';
import 'package:blocproject/apiservices/moviemodel.dart';
import 'package:blocproject/widgets/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchHistoryBloc, WatchHistoryState>(
      builder: (context, state) {
        if(state is WatchHistoryInitial){
            return  const Center(
              child: CircularProgressIndicator(),
            );
          }else
        if (state is WatchHistoryLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WatchHistoryLoaded) {
          final watchHistory = state.watchHistory;

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
                              // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailsPage(movie: watchHistory[index] as Movie)));
                            },
                            child: Container(
                              color: Colors.brown,
                              child: SizedBox(
                                width: 150,
                                height: 100,
                                child: Image.network(
                                    filterQuality: FilterQuality.high,
                                    fit: BoxFit.cover,
                                    // ''
                                    '${Keys.imagePath}${watchHistory[index].imageUrl}'),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          watchHistory[index].title,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 20,
                      ),
                  itemCount: watchHistory.length > 5 ? 5 : watchHistory.length
                  // movie.length
                  ));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
