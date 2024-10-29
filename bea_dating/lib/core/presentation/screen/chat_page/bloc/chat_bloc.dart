import 'dart:async';
import 'dart:developer';
import 'package:bea_dating/core/data/data_source_getting/chat_service.dart';
import 'package:bea_dating/core/data/data_source_getting/userdata.dart';
import 'package:bea_dating/core/data/data_uploading/chat_image_service.dart';
import 'package:bea_dating/core/domin/usecase/image_upload.dart';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitial()){
    on<IndividualEvent>(individualEvent);
    on<TesxtMessagesentEvent>(tesxtMessagesentEvent);
    on< EmojiCoditionEvent>( emojiCoditionEvent);
    on<ImagePickEvent>(imagePickEvent);
    on<CameraPickEvent>(cameraPickEvent);
  }

  FutureOr<void> individualEvent(IndividualEvent event, Emitter<ChatState> emit) {
    emit(NavigateToIndividualState(user: event.user ));
  }

  FutureOr<void> tesxtMessagesentEvent(TesxtMessagesentEvent event, Emitter<ChatState> emit) {
    Chat chat=Chat();
    chat.creatChatRoom(event.receiverId, event.text, "text");
   


  }

  FutureOr<void> emojiCoditionEvent(EmojiCoditionEvent event, Emitter<ChatState> emit) {
    emit(EmojiCoditionState(isEmoji: event.isEmoji));
  }

  FutureOr<void> imagePickEvent(ImagePickEvent event, Emitter<ChatState> emit)async {
        Chat chat=Chat();
        // media pickig 
    List<XFile?>images=await ImagePicker().pickMultipleMedia();

     List<String> _imgUrl = [];
     for (int i = 0; i < images.length; i++) {
          // image storing to fire base
          if(images[i]!.path.contains("jpg")){
          _imgUrl.add(await ChatImageUpload(
              "Chatmedia", await images[i]!.readAsBytes()));
          }else{
            _imgUrl.add(await ChatvideoUpload(
              "Chatmedia", await images[i]!.readAsBytes()));
              log(images[0]!.path);
          }
        }
      
      
  //media updating
  for(int i=0;i<_imgUrl.length;i++){
    if(_imgUrl[i].contains("mp4")){
        await chat.creatChatRoom(event.receiverId,_imgUrl[i],"mp4");
    }else{
        await chat.creatChatRoom(event.receiverId,_imgUrl[i],"image");
    }


 }
  }

  FutureOr<void> cameraPickEvent(CameraPickEvent event, Emitter<ChatState> emit) async{
log("hii camera");
log("camera${event.imagePath}");

  }
  
}
