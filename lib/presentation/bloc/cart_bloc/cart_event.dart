part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent{}
class CartIncrementEvent extends CartEvent{}
class CartDecrementEvent extends CartEvent{}
class CartDeleteEvent extends CartEvent{}
