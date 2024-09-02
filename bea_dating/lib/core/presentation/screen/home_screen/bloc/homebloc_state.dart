part of 'homebloc_bloc.dart';

@immutable
abstract class HomeblocState {}

class HomeblocInitial extends HomeblocState {}
class BottomNavigatorEindexState extends HomeblocState{
  final int Eindex;

  BottomNavigatorEindexState({required this.Eindex});
}