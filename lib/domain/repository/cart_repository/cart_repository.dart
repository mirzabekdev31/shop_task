import 'package:shop_app_task/data/models/product_model.dart';

abstract class CartRepository{
  Future<List<Product>> getCartProducts();
  Future<void> deleteProduct(Product product);
}