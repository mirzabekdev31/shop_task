part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeAllEvent extends HomeEvent{}
class HomeElectronicsEvent extends HomeEvent{}
class HomeJeweleryEvent extends HomeEvent{}
class HomeMensClothingEvent extends HomeEvent{}
class HomeWoMensClothingEvent extends HomeEvent{}
class HomeAddCartEvent extends HomeEvent{
  final int index;
  HomeAddCartEvent(this.index);
}

class HomeAddLikeEvent extends HomeEvent{
  final int index;
  HomeAddLikeEvent(this.index);
}