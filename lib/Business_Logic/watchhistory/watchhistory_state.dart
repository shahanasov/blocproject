part of 'watchhistory_bloc.dart';


abstract class WatchHistoryState {}

class WatchHistoryInitial extends WatchHistoryState {}
class WatchHistoryAdded extends WatchHistoryState{}

class WatchHistoryLoading extends WatchHistoryState {}

class WatchHistoryLoaded extends WatchHistoryState {
  final List<WatchHistory> watchHistory;

  WatchHistoryLoaded(this.watchHistory);
}

class WatchHistoryError extends WatchHistoryState {
  final String message;

  WatchHistoryError(this.message);
}
