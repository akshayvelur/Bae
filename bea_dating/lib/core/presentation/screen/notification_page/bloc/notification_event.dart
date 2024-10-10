part of 'notification_bloc.dart';

@immutable
abstract class NotificationEvent {}
class RequestAcceptEvent extends NotificationEvent{
  final String Requester;

  RequestAcceptEvent({required this.Requester});
}