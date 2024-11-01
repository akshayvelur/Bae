part of 'homebloc_bloc.dart';

@immutable
abstract class HomeblocEvent {}
class BottoNavigatorEindexEvent extends HomeblocEvent{
  final int Eindex;

  BottoNavigatorEindexEvent({required this.Eindex});
}
class InitUserNameEvent extends HomeblocEvent{

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
  class ViewAccountEvent extends HomeblocEvent{
    final String uid;

  ViewAccountEvent({required this.uid});
    
  }
  class ProfileViewInitEvent extends HomeblocEvent{
    final String uid;

  ProfileViewInitEvent({required this.uid});
  }
  class DistanceFilterEvent extends HomeblocEvent{

    final double distance;

  DistanceFilterEvent({required this.distance});
  }



