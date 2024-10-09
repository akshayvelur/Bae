part of 'homebloc_bloc.dart';

@immutable
abstract class HomeblocEvent {}
class BottoNavigatorEindexEvent extends HomeblocEvent{
  final int Eindex;

  BottoNavigatorEindexEvent({required this.Eindex});
}
class CountEvent extends HomeblocEvent{
final int count;

  CountEvent({required this.count});
}
class NumberOfUserEvent extends HomeblocEvent{
 final int numberOfUser;

  NumberOfUserEvent({required this.numberOfUser});
}class InitEvent extends HomeblocEvent{

  }
  class UserLikeEvent extends HomeblocEvent{
    final String? likeduser;
    

  UserLikeEvent({required this.likeduser});
  }


