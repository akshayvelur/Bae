part of 'homebloc_bloc.dart';

@immutable
abstract class HomeblocEvent {}
class BottoNavigatorEindexEvent extends HomeblocEvent{
  final int Eindex;

  BottoNavigatorEindexEvent({required this.Eindex});
}
class InitUserEvent extends HomeblocEvent{

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
  class DistanceFilterSliderEvent extends HomeblocEvent{
    final double distance;

  DistanceFilterSliderEvent({required this.distance});
  }

  class AgeFilterEvent extends HomeblocEvent{
    final double age1;
     final double age2;

  AgeFilterEvent({required this.age1,required this.age2});
  }
  class ShowmeEvent extends HomeblocEvent{
   final String gender;
   final int index;

  ShowmeEvent({required this.gender, required this.index});
  }
  class DiscoverySubmissionEvent extends HomeblocEvent{

  }
  class NavigateToDiacoveryEvent extends HomeblocEvent{
  }
  class CurrentUserLikeEvent extends HomeblocEvent{

  }
  class LikeFromProfileEvent extends HomeblocEvent{
  final String like;

  LikeFromProfileEvent({required this.like});
  }
    class UnfollowFromProfileEvent extends HomeblocEvent{
  final String unlik;

  UnfollowFromProfileEvent({required this.unlik});
  }
class FilterationEvent extends HomeblocEvent{
   final List<Map<String, dynamic>> dataList ;
   final List<String>distance;

  FilterationEvent({required this.dataList,required this.distance});
}


