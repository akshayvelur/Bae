part of 'user_upload_bloc.dart';

@immutable
abstract class UserUploadState {
  final String? interest;
  final String? about;
  final String ? relationship;
    final int ? reindex;
    final String ? heights;
    final String ? drink;
    final String ?gym;
    final String ?smoke;
  
  UserUploadState({required this.interest, required this.about,required this.relationship,required this.reindex,required this.heights,required this.drink,required this.gym,required this.smoke});
}

class UserUploadInitial extends UserUploadState {
  UserUploadInitial({required super.interest, required super.about, required super.relationship, required super.reindex, required super.heights, required super.drink, required super.gym, required super.smoke}) ;
}
class  UserInterestSelectedState extends UserUploadState{
  UserInterestSelectedState({required super.interest, required super.about, required super.relationship, required super.reindex, required super.heights, required super.drink, required super.gym, required super.smoke});
}
class UserAboutSelectedState extends UserUploadState{
  UserAboutSelectedState({required super.interest, required super.about, required super.relationship, required super.reindex, required super.heights, required super.drink, required super.gym, required super.smoke});
}
class UserLoadingSuccessState extends UserUploadState{
  UserLoadingSuccessState({required super.interest, required super.about, required super.relationship, required super.reindex, required super.heights, required super.drink, required super.gym, required super.smoke});
}
class RelationshipSelectedState extends UserUploadState{

  RelationshipSelectedState({required super.interest, required super.about, required super.relationship, required super.reindex, required super.heights, required super.drink, required super.gym, required super.smoke,});
}
class HeightSelectedState extends UserUploadState{
  HeightSelectedState({required super.interest, required super.about, required super.relationship, required super.reindex, required super.heights, required super.drink, required super.gym, required super.smoke});
}
class DrinkSelectedState extends UserUploadState{
  final int index;
  DrinkSelectedState({required super.interest, required super.about, required super.relationship, required super.reindex, required super.heights, required super.drink,required this.index, required super.gym, required super.smoke});
}
class GymSelectedState extends UserUploadState{
  final int gymindex;
  GymSelectedState({required super.interest, required super.about, required super.relationship, required super.reindex, required super.heights, required super.drink,required this.gymindex, required super.gym, required super.smoke});
}
class SmokeSelectedState extends UserUploadState{
  final int smokeindex;
  SmokeSelectedState({required super.interest, required super.about, required super.relationship, required super.reindex, required super.heights, required super.drink,required this.smokeindex, required super.gym, required super.smoke});
}
class UserBackDataSubmitted extends UserUploadState{
  UserBackDataSubmitted({required super.interest, required super.about, required super.relationship, required super.reindex, required super.heights, required super.drink, required super.gym, required super.smoke});

}