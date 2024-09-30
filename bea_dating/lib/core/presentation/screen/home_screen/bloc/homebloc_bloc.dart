// ignore_for_file: unused_local_variable

import 'dart:async';

import 'package:bea_dating/core/data/data_source/userdata.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'homebloc_event.dart';
part 'homebloc_state.dart';

class HomeblocBloc extends Bloc<HomeblocEvent, HomeblocState> {
  HomeblocBloc() : super(HomeblocInitial()){
 on<BottoNavigatorEindexEvent>(bottoNavigatorEindexEvent);
 on<CountEvent>(countEvent);
 on<NumberOfUserEvent>(numberOfUserEvent);
  }


  FutureOr<void> bottoNavigatorEindexEvent(BottoNavigatorEindexEvent event, Emitter<HomeblocState> emit) {
    emit(BottomNavigatorEindexState(Eindex: event.Eindex));
  }

  

  FutureOr<void> countEvent(CountEvent event, Emitter<HomeblocState> emit) {
    print(event.count);
    emit(CountUpdatestate(count:event.count));
  }

  FutureOr<void> numberOfUserEvent(NumberOfUserEvent event, Emitter<HomeblocState> emit) {
    emit(NumberOfUserSelectedState(numberOfUser: event.numberOfUser));
  }
}
