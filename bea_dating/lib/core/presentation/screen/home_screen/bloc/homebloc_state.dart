part of 'homebloc_bloc.dart';

@immutable
abstract class HomeblocState {
   final String ?gender;
   final int? index;
    final double? age1;
   final double ?age2;
    final double ?distance;

  HomeblocState({required this.gender, required this.index, required this.age1, required this.age2, required this.distance});
}

abstract class HomeActionState extends HomeblocState{
  HomeActionState({required super.gender, required super.index, required super.age1, required super.age2, required super.distance});

}
class InitUserNameState extends HomeblocState{
final Map<String,dynamic> user;

  InitUserNameState({required this.user, required super.gender, required super.index, required super.age1, required super.age2, required super.distance});

}

 class HomeblocInitial extends HomeblocState {
  HomeblocInitial({required super.gender, required super.index, required super.age1, required super.age2, required super.distance});

}
class BottomNavigatorEindexState extends HomeblocState{
  final int Eindex;

  BottomNavigatorEindexState({required this.Eindex, required super.gender, required super.index, required super.age1, required super.age2, required super.distance});
}
class CountUpdatestate extends HomeblocState{
final int count;
   CountUpdatestate({required this.count, required super.gender, required super.index, required super.age1, required super.age2, required super.distance});
}
class NumberOfUserSelectedState extends HomeblocState{
  final int numberOfUser;

  NumberOfUserSelectedState({required this.numberOfUser, required super.gender, required super.index, required super.age1, required super.age2, required super.distance});
}
class InitState extends HomeblocState{
  final String uid;
  InitState({required this.uid, required super.gender, required super.index, required super.age1, required super.age2, required super.distance});
}
class UserLikeAddedState extends HomeblocState{
  UserLikeAddedState({required super.gender, required super.index, required super.age1, required super.age2, required super.distance});
 
}
class ViewAccountState extends HomeblocState{
  final String uid;

  ViewAccountState({required this.uid, required super.gender, required super.index, required super.age1, required super.age2, required super.distance});
}
class ProfileViewInitState extends HomeblocState{
      final UserModel ?user;

  ProfileViewInitState({required this.user, required super.gender, required super.index, required super.age1, required super.age2, required super.distance});
}
class ProfileLoadingSuccessState extends HomeActionState{
   final UserModel ?user;

  ProfileLoadingSuccessState({required this.user, required super.gender, required super.index, required super.age1, required super.age2, required super.distance});
}
class DistanceFilterState extends HomeblocState{
    final List<String>mydata;

  DistanceFilterState({required this.mydata, required super.gender, required super.index, required super.age1, required super.age2, required super.distance});
  }
  class DistanceFilterSliderState extends HomeblocState{
  DistanceFilterSliderState({required super.gender, required super.index, required super.age1, required super.age2, required super.distance});



  }

  class AgeFilterState extends HomeblocState{
  AgeFilterState({required super.gender, required super.index, required super.age1, required super.age2, required super.distance});


  }
  class ShowmeState extends HomeblocState{
  ShowmeState({required super.gender, required super.index, required super.age1, required super.age2, required super.distance});

  }
  class DiscoverySubmissionState extends HomeActionState{
  DiscoverySubmissionState({required super.gender, required super.index, required super.age1, required super.age2, required super.distance});

  }
  class DiscoveryInitState extends HomeblocState{
  DiscoveryInitState({required super.gender, required super.index, required super.age1, required super.age2, required super.distance});
    
  }
    class NavigateToDiacoveryState extends HomeblocState{
      final List<String> ageRange;
      final String showme;
      final String maxDistance;
  NavigateToDiacoveryState({required this.ageRange,required this.maxDistance,required this.showme,required super.gender, required super.index, required super.age1, required super.age2, required super.distance});
    
  }
   class CurrentUserLikeState extends HomeblocState{
   final List<String>like;

  CurrentUserLikeState({required super.gender, required super.index, required super.age1, required super.age2, required super.distance, required this.like});
 

   }
  class LikeFromProfileState extends  HomeActionState{
  LikeFromProfileState({required super.gender, required super.index, required super.age1, required super.age2, required super.distance});
  }
 class UnfollowFromProfileState extends  HomeActionState{
UnfollowFromProfileState({required super.gender, required super.index, required super.age1, required super.age2, required super.distance});
  }
  class FilterationState extends HomeblocState{
   final List<Map<String, dynamic>> filteredList;
   final int boost;
  FilterationState({required super.gender, required super.index, required super.age1, required super.age2, required super.distance,required this.filteredList,required this.boost});

 
}