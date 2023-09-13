part of 'home_bloc.dart';

class HomeState {
  final HomeStatus status;
  final String message;
  final List<Product> product;

  const HomeState(
      {this.status = HomeStatus.initial,
      this.message = "",
      this.product = const []});

  HomeState copyWith({
    HomeStatus? status,
    String? message,
    List<Product>? product,
  }) {
    return HomeState(
        status: status ?? this.status,
        message: message ?? this.message,
        product: product ?? this.product);
  }
}

enum HomeStatus { initial, loading, success, failed }
