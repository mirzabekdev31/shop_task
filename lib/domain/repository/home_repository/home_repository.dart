import 'package:shop_app_task/data/models/product_model.dart';

abstract class HomeRepository{
  Future<List<Product>> getAllProduct();
  Future<List<Product>> getElectronics();
  Future<List<Product>> getJewelery();
  Future<List<Product>> getMensClothing();
  Future<List<Product>> getWoMensClothing();
}