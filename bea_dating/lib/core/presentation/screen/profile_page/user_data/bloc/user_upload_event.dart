part of 'user_upload_bloc.dart';

@immutable
abstract class UserUploadEvent {}
class UserInterestAddingEvent extends UserUploadEvent{
  final String ? interest;
 UserInterestAddingEvent({required this.interest});
}
class UserAboutAddingEvent extends  UserUploadEvent{
  final String? about;

  UserAboutAddingEvent({required this.about});
}
class UserLoadingEvent extends UserUploadEvent{}
class RelationshipSelectEvent extends UserUploadEvent{
  final String relationship;
  final int indext;

  RelationshipSelectEvent({required this.relationship,required this.indext});
}
class HeightSelectingEvent extends UserUploadEvent{
 final String heights;

  HeightSelectingEvent({required this.heights});
}
class DrinkSelectEvent extends UserUploadEvent{
  final String drink;
  final int indext;

  DrinkSelectEvent({required this.drink, required this.indext});
}