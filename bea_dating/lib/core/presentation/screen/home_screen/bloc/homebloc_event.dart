part of 'homebloc_bloc.dart';

@immutable
abstract class HomeblocEvent {}
class BottoNavigatorEindexEvent extends HomeblocEvent{
  final int Eindex;

  BottoNavigatorEindexEvent({required this.Eindex});
}