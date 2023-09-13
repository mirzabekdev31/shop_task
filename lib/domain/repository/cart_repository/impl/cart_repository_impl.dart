import 'package:shop_app_task/data/database/database_helper.dart';
import 'package:shop_app_task/data/models/product_model.dart';
import 'package:shop_app_task/di/di.dart';
import 'package:shop_app_task/domain/repository/cart_repository/cart_repository.dart';

class CartRepositoryImpl extends CartRepository{

  final databaseHelper = di<DatabaseHelper>();

  @override
  Future<List<Product>> getCartProducts() async{
    final products=await databaseHelper.getCartProducts();
    return products;
  }

  @override
  Future<void> deleteProduct(Product product) async{
    //   // Mahsulotni bazadan o'chirish

  }

}