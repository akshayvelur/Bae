part of 'chat_bloc.dart';

@immutable
abstract class ChatEvent {}
class IndividualEvent extends ChatEvent{
final Map<String,dynamic> user;

  IndividualEvent({required this.user});

}
class TesxtMessagesentEvent extends ChatEvent{
  final String text;
  final String receiverId;

  TesxtMessagesentEvent({required this.text,required this.receiverId});
}
class EmojiCoditionEvent extends ChatEvent{
 final bool isEmoji;

  EmojiCoditionEvent({required this.isEmoji});
}
class ImagePickEvent extends ChatEvent{
    final String receiverId;

  ImagePickEvent({required this.receiverId});
}
class CameraPickEvent extends ChatEvent{
    final String receiverId;

  CameraPickEvent({required this.receiverId});
}