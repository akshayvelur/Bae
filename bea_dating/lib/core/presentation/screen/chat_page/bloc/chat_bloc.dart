import 'dart:async';

import 'package:bea_dating/core/data/data_source/chat_service.dart';
import 'package:bea_dating/core/data/data_source/userdata.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitial()){
    on<IndividualEvent>(individualEvent);
    on<TesxtMessagesentEvent>(tesxtMessagesentEvent);
  }

  FutureOr<void> individualEvent(IndividualEvent event, Emitter<ChatState> emit) {
    emit(NavigateToIndividualState(user: event.user ));
  }

  FutureOr<void> tesxtMessagesentEvent(TesxtMessagesentEvent event, Emitter<ChatState> emit) {
    Chat chat=Chat();
    chat.creatChatRoom(event.receiverId, event.text, "text");
   


  }
}
