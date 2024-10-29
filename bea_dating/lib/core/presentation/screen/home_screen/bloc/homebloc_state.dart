part of 'homebloc_bloc.dart';

@immutable
abstract class HomeblocState {


}

abstract class HomeActionState extends HomeblocState{

}
class InitUserNameState extends HomeblocState{
final String userName;

  InitUserNameState({required this.userName});

}

 class HomeblocInitial extends HomeblocState {

}
class BottomNavigatorEindexState extends HomeblocState{
  final int Eindex;

  BottomNavigatorEindexState({required this.Eindex});
}
class CountUpdatestate extends HomeblocState{
final int count;
   CountUpdatestate({required this.count});
}
class NumberOfUserSelectedState extends HomeblocState{
  final int numberOfUser;

  NumberOfUserSelectedState({required this.numberOfUser});
}
class InitState extends HomeblocState{
  final String uid;
  InitState({required this.uid});
}
class UserLikeAddedState extends HomeblocState{
 
}
class ViewAccountState extends HomeblocState{
  final String uid;

  ViewAccountState({required this.uid});
}
class ProfileViewInitState extends HomeblocState{
      final UserModel ?user;

  ProfileViewInitState({required this.user});
}
class ProfileLoadingSuccessState extends HomeActionState{
   final UserModel ?user;

  ProfileLoadingSuccessState({required this.user});
}