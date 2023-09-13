import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_task/data/database/database_helper.dart';
import 'package:shop_app_task/data/models/product_model.dart';
import 'package:shop_app_task/di/di.dart';
import 'package:shop_app_task/presentation/bloc/cart_bloc/cart_bloc.dart';

// class CartScreen extends StatelessWidget {
//   const CartScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final databaseHelper = di<DatabaseHelper>();
//
//
//     return const Placeholder();
//   }
// }


class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Product> cartProducts = [];

  @override
  void initState() {
    super.initState();
    // Bazadan mahsulotlar ro'yxatini olish
    _getCartProducts();
  }

  Future<void> _getCartProducts() async {
    final products = await DatabaseHelper().getCartProducts();
    print("ppppppppp ================ ${products}");
    setState(() {
      cartProducts = products;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Savatcha'),
          ),
          body: Builder(
            builder: (context) {
              if (state.status == CartStatus.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.status == CartStatus.failed) {
                return Center(
                  child: Text(state.message),
                );
              }
              return ListView.builder(
                itemCount: cartProducts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.products[index].title ?? ''),
                    subtitle: Text('\$${state.products[index].price ?? 0}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        // Mahsulotni savatchadan olib tashlash
                        //_removeProductFromCart(cartProducts[index]);
                      },
                    ),
                  );
                },
              );
            }
          ),
        );
      },
    );
  }

// void _removeProductFromCart(Product product) async {
//   // Mahsulotni bazadan o'chirish
//   final db = DatabaseHelper();
//   await db.db;
//   await db.deleteProduct(product.id!);
//
//   // Mahsulotlarni qayta yuklash
//   await _getCartProducts();
// }
}
