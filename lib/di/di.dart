import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shop_app_task/data/api/api_base.dart';
import 'package:shop_app_task/data/api/api_service.dart';
import 'package:shop_app_task/data/database/database_helper.dart';
import 'package:shop_app_task/domain/repository/cart_repository/cart_repository.dart';
import 'package:shop_app_task/domain/repository/cart_repository/impl/cart_repository_impl.dart';
import 'package:shop_app_task/domain/repository/home_repository/home_repository.dart';
import 'package:shop_app_task/domain/repository/home_repository/impl/home_repositor_impl.dart';

final di=GetIt.instance;

Future<void> setup() async{
  di.registerSingleton(
      ApiBase(Dio(BaseOptions(
        baseUrl: "https://fakestoreapi.com/",
        connectTimeout: const Duration(seconds: 60),
      )))
  );
  di.registerFactory(() => ApiService(di.get()));
  di.registerFactory<HomeRepository>(() => HomeRepositoryImpl(di.get()));
  di.registerSingleton(DatabaseHelper());
  di.registerFactory<CartRepository>(()=>CartRepositoryImpl());
}