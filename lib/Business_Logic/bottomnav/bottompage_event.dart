part of 'bottompage_bloc.dart';

class BottompageEvent {}

class TabChange extends BottompageEvent {
  final int tabIndex;

  TabChange({required this.tabIndex});
}
