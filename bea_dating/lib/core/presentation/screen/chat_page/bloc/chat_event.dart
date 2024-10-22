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