part of 'watchhistory_bloc.dart';

class WatchHistoryEvent {}



class LoadWatchHistory extends WatchHistoryEvent {}

class AddToWatchlist extends WatchHistoryEvent {
  final int mediaId;

  AddToWatchlist(this.mediaId);
}

class RemoveFromWatchlist extends WatchHistoryEvent{
  final int mediaId;

  RemoveFromWatchlist(this.mediaId);
}

