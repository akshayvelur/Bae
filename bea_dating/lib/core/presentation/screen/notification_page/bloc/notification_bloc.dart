import 'dart:async';

import 'package:bea_dating/core/domin/usecase/like_user.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationInitial()){
    on<RequestAcceptEvent>(requestAcceptEvent);
  }


  FutureOr<void> requestAcceptEvent(RequestAcceptEvent event, Emitter<NotificationState> emit) {
    requestAccepting(event.Requester);
    emit(RequestAcceptedState());
      }
}
