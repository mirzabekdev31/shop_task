import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app_task/data/database/database_helper.dart';
import 'package:shop_app_task/data/models/product_model.dart';
import 'package:shop_app_task/di/di.dart';
import 'package:shop_app_task/domain/repository/cart_repository/cart_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {

  final databaseHelper = di<DatabaseHelper>();
  final CartRepository cartRepository;

  CartBloc(this.cartRepository) : super(const CartState()) {
    on<CartInitialEvent>((event, emit) async{
      final products=await cartRepository.getCartProducts();
      print("hiiiiiiiii ======================= ${products}");
      emit(state.copyWith(products: products,status: CartStatus.success));
    });
    on<CartIncrementEvent>((event, emit) {

    });
    on<CartDecrementEvent>((event, emit) {

    });
    on<CartDeleteEvent>((event, emit) {

    });
  }
}
