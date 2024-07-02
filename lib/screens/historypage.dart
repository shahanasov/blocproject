import 'package:blocproject/Business_Logic/watchhistory/watchhistory_bloc.dart';
import 'package:blocproject/apiservices/functionsapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<WatchHistoryBloc>().add(LoadWatchHistory());
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text('History'),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('Edit'),
          )
        ],
      ),
      body: BlocBuilder<WatchHistoryBloc, WatchHistoryState>(
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
            return ListView.builder(
                itemCount: watchHistory.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Container(
                      width: 120,
                      height: 100,
                      color: Colors.brown,
                        child: Image.network(
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover,
                            
                            '${Keys.imagePath}${watchHistory[index].imageUrl}',
                            ),
                    ),
                    title: Text(watchHistory[index].title),
                    subtitle:  Text(watchHistory[index].watchedAt.year.toString()),
                  );
                });
          } else if (state is WatchHistoryError) {
            return const Center(
              child: Text('error'),
            );
          } else {
            return const Center(
              child: Text('NO History'),
            );
          }
        },
      ),
    );
  }
}
