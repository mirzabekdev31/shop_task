part of 'cart_bloc.dart';

@immutable
class CartState {
  final String message;
  final CartStatus status;
  final List<Product> products;
  final String dataTime;

  const CartState(
      {this.message = '',
      this.status = CartStatus.initial,
      this.products = const [],
      this.dataTime = ''});

  CartState copyWith(
      {String? message,
      CartStatus? status,
      List<Product>? products,
      String? dataTime}) {
    return CartState(
        message: message ?? this.message,
        status: status ?? this.status,
        products: products ?? this.products,
        dataTime: dataTime ?? this.dataTime);
  }
}

enum CartStatus { initial, loading, success, failed }
