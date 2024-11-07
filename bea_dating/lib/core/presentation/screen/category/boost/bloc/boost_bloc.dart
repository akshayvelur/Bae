import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'boost_event.dart';
part 'boost_state.dart';

class BoostBloc extends Bloc<BoostEvent, BoostState> {
  BoostBloc() : super(BoostInitial()){
on<PaymentUpdatedEvent>(paymentUpdatedEvent);
on<BoostUpdatingEvent>(boostUpdatingEvent);
  }



  FutureOr<void> paymentUpdatedEvent(PaymentUpdatedEvent event, Emitter<BoostState> emit) {
    
  }

  FutureOr<void> boostUpdatingEvent(BoostUpdatingEvent event, Emitter<BoostState> emit) {
    print("topupooooo");
  }
}
