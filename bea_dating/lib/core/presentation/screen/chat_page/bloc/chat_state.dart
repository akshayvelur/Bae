part of 'chat_bloc.dart';

@immutable
abstract class ChatState {
  void add() {}
}

class ChatInitial extends ChatState {}
class NavigateToIndividualState extends ChatState{
  final Map<String,dynamic> user;

  NavigateToIndividualState({required this.user});
}
class TesxtMessagesentState extends ChatState{

}
class EmojiCoditionState extends ChatState{
 final bool isEmoji;

  EmojiCoditionState({required this.isEmoji});
}
class ImagePickedState extends ChatState{

}
class CameraPickedState extends ChatState{
  
}