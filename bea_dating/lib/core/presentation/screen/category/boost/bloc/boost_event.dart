part of 'boost_bloc.dart';

@immutable
abstract class BoostEvent {}
class PaymentUpdatedEvent extends BoostEvent{
final int amount;

  PaymentUpdatedEvent({required this.amount});
}
class BoostUpdatingEvent extends BoostEvent{
  final String topUp;

  BoostUpdatingEvent({required this.topUp});
}