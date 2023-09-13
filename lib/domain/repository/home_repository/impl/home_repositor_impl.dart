import 'package:shop_app_task/data/api/api_service.dart';
import 'package:shop_app_task/data/models/product_model.dart';
import 'package:shop_app_task/domain/repository/home_repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository{

  final ApiService _apiService;

  HomeRepositoryImpl(this._apiService);

  @override
  Future<List<Product>> getAllProduct() async{
    final response= await _apiService.getAllProducts();
    print("Price ===========  ${response[0].price}");
    return response;
  }

  @override
  Future<List<Product>> getElectronics() async{
    final response= await _apiService.getElectronics();
    return response;
  }

  @override
  Future<List<Product>> getJewelery() async{
    final response= await _apiService.getJewelery();
    return response;
  }

  @override
  Future<List<Product>> getMensClothing() async{
    final response= await _apiService.getMensClothing();
    return response;
  }

  @override
  Future<List<Product>> getWoMensClothing() async{
    final response= await _apiService.getWoMensClothing();
    return response;
  }

}