import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'homebloc_event.dart';
part 'homebloc_state.dart';

class HomeblocBloc extends Bloc<HomeblocEvent, HomeblocState> {
  HomeblocBloc() : super(HomeblocInitial()){
 on<BottoNavigatorEindexEvent>(bottoNavigatorEindexEvent);
  }


  FutureOr<void> bottoNavigatorEindexEvent(BottoNavigatorEindexEvent event, Emitter<HomeblocState> emit) {
    emit(BottomNavigatorEindexState(Eindex: event.Eindex));
  }
}
