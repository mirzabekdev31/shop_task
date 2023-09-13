import 'package:shop_app_task/data/api/api_base.dart';
import 'package:shop_app_task/data/models/product_model.dart';
import 'package:shop_app_task/utils/constants/base_url.dart';

class ApiService{

  final ApiBase _base;

  ApiService(this._base);

  
  Future<List<Product>> getAllProducts() async{
    final response=await _base.dio.get("products/");
    print("==============================================================================");
    print("Response ========= ${response}");
    return (response.data as List)
        .map((e) => Product.fromJson(e))
        .toList();
  }
  
  Future<List<Product>> getElectronics() async{
    final response= await _base.dio.get("products/category/electronics");
    return (response.data as List)
        .map((e) => Product.fromJson(e))
        .toList();
  }

  Future<List<Product>> getJewelery() async{
    final response= await _base.dio.get("products/category/jewelery");
    return (response.data as List)
        .map((e) => Product.fromJson(e))
        .toList();
  }

  Future<List<Product>> getMensClothing() async{
    final response= await _base.dio.get("products/category/men's clothing");
    return (response.data as List)
        .map((e) => Product.fromJson(e))
        .toList();
  }

  Future<List<Product>> getWoMensClothing() async{
    final response= await _base.dio.get("products/category/women's clothing");
    return (response.data as List)
        .map((e) => Product.fromJson(e))
        .toList();
  }

}