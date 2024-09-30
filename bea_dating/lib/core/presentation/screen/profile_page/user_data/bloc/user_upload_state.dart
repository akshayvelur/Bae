part of 'user_upload_bloc.dart';

@immutable
abstract class UserUploadState {
  final String? interest;
  final String? about;
  final String ? relationship;
    final int ? reindex;
    final String ? heights;
    final String ? drink;
  
  UserUploadState({required this.interest, required this.about,required this.relationship,required this.reindex,required this.heights,required this.drink});
}

class UserUploadInitial extends UserUploadState {
  UserUploadInitial({required super.interest, required super.about, required super.relationship, required super.reindex, required super.heights, required super.drink}) ;
}
class  UserInterestSelectedState extends UserUploadState{
  UserInterestSelectedState({required super.interest, required super.about, required super.relationship, required super.reindex, required super.heights, required super.drink});
}
class UserAboutSelectedState extends UserUploadState{
  UserAboutSelectedState({required super.interest, required super.about, required super.relationship, required super.reindex, required super.heights, required super.drink});
}
class UserLoadingSuccessState extends UserUploadState{
  UserLoadingSuccessState({required super.interest, required super.about, required super.relationship, required super.reindex, required super.heights, required super.drink});
}
class RelationshipSelectedState extends UserUploadState{

  RelationshipSelectedState({required super.interest, required super.about, required super.relationship, required super.reindex, required super.heights, required super.drink,});
}
class HeightSelectedState extends UserUploadState{
  HeightSelectedState({required super.interest, required super.about, required super.relationship, required super.reindex, required super.heights, required super.drink});
}
class DrinkSelectedState extends UserUploadState{
  final int index;
  DrinkSelectedState({required super.interest, required super.about, required super.relationship, required super.reindex, required super.heights, required super.drink,required this.index});
}