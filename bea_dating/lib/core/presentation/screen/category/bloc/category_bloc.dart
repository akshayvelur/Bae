import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()){
    on<BootEvent>(bootEvent);
  }

  FutureOr<void> bootEvent(BootEvent event, Emitter<CategoryState> emit) {
    emit(NavigateToBoostState());
  }
}
