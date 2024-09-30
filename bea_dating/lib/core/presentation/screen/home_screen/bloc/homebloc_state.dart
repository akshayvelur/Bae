part of 'homebloc_bloc.dart';

@immutable
abstract class HomeblocState {}

class HomeblocInitial extends HomeblocState {}
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