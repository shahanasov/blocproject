import 'package:bloc/bloc.dart';

part 'bottompage_event.dart';
part 'bottompage_state.dart';

class BottompageBloc extends Bloc<BottompageEvent, BottompageState> {
  BottompageBloc() : super(const BottompageInitial(tabIndex: 0)) {
    on<BottompageEvent>((event, emit) {
      if(event is TabChange){
        emit(BottompageInitial(tabIndex: event.tabIndex));
      }
    });
  }
}
