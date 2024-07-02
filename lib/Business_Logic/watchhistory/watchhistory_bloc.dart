import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blocproject/apiservices/functionsapi.dart';
import 'package:blocproject/apiservices/moviemodel.dart';

part 'watchhistory_event.dart';
part 'watchhistory_state.dart';

class WatchHistoryBloc extends Bloc<WatchHistoryEvent, WatchHistoryState> {
  final Api api;
  WatchHistoryBloc({required this.api}) : super(WatchHistoryInitial()) {
    on<AddToWatchlist>(addToWatchlist);
    on<LoadWatchHistory>(getWatchHistory);
  }

  FutureOr<void> addToWatchlist(
      AddToWatchlist event, Emitter<WatchHistoryState> emit) async {
    // emit(WatchHistoryInitial());
    try {
      await api.addToWatchlist(event.mediaId, true);
      emit(WatchHistoryAdded());
    } catch (e) {
      emit(WatchHistoryError(e.toString()));
    }
  }

  FutureOr<void> getWatchHistory(LoadWatchHistory event, Emitter<WatchHistoryState> emit) async{
    emit(WatchHistoryInitial());
     try {
     final movies= await api.getWatchHistory();
      emit(WatchHistoryLoaded(movies));
    } catch (e) {
      emit(WatchHistoryError(e.toString()));
    }
  }
}
